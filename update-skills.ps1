# Skills 插件库刷新脚本：从官方 anthropics/skills 与精选 awesome 清单抓取 SKILL.md 元数据，写入 skills.json
$ErrorActionPreference = 'Stop'
$headers = @{ 'User-Agent' = 'github-hot-daily' }
$now = Get-Date
$skills = @()

function Get-SkillMd([string]$repo, [string]$branch, [string]$path) {
    try {
        $raw = Invoke-WebRequest -Headers $headers "https://raw.githubusercontent.com/$repo/$branch/$path" -UseBasicParsing -TimeoutSec 30
        return $raw.Content
    } catch { return '' }
}

function Convert-Frontmatter([string]$md) {
    # 解析 YAML frontmatter 里的 name / description（多行折叠符 > 与 | 兼容）
    $name = ''; $desc = ''
    if ($md -match '(?s)^---\r?\n(.*?)\r?\n---') {
        $fm = $Matches[1]
        if ($fm -match '(?m)^name:\s*(.+)$')   { $name = $Matches[1].Trim() }
        if ($fm -match '(?s)^description:\s*>\r?\n((?:(?!\S)|\s).*(?:\r?\n\s{2}.*)*)') {
            $desc = (($Matches[1] -split "`n") | ForEach-Object { $_.Trim() }) -join ' '
        } elseif ($fm -match '(?m)^description:\s*(.+)$') {
            $desc = $Matches[1].Trim()
        }
        $desc = ($desc -replace '^>\s*', '' -replace '\s*\|$', '').Trim()
    }
    return @{ name = $name; desc = $desc }
}

# ── 来源 1：anthropics/skills 官方仓库（每个子目录一个 skill）──
try {
    $dirs = Invoke-RestMethod -Headers $headers 'https://api.github.com/repos/anthropics/skills/contents/skills' -TimeoutSec 30
    foreach ($d in @($dirs | Where-Object { $_.type -eq 'dir' })) {
        $md = Get-SkillMd 'anthropics/skills' 'main' "skills/$($d.name)/SKILL.md"
        if (-not $md) { continue }
        $fm = Convert-Frontmatter $md
        if (-not $fm.name) { $fm.name = $d.name }
        if (-not $fm.desc) {
            # frontmatter 解析失败时取正文第一个有效段落（跳过 frontmatter 区、标题、空行与字段行）
            $inFm = $false; $body = ''
            foreach ($ln in ($md -split "`n")) {
                $t = $ln.Trim()
                if ($t -eq '---') { $inFm = -not $inFm; continue }
                if ($inFm -or -not $t -or $t.StartsWith('#')) { continue }
                if ($t -match '^(name|description|license|metadata|allowed-tools|argument-hint):') { continue }
                $body = $t; break
            }
            $fm.desc = if ($body) { $body.Trim() } else { '' }
        }
        $skills += [ordered]@{
            name   = $fm.name
            repo   = 'anthropics/skills'
            url    = "https://github.com/anthropics/skills/tree/main/skills/$($d.name)"
            desc   = if ($fm.desc.Length -gt 300) { $fm.desc.Substring(0,300) + '…' } else { $fm.desc }
            source = 'official'
        }
    }
    Write-Output "官方 skills: $($skills.Count) 个"
} catch { Write-Warning "anthropics/skills 抓取失败: $($_.Exception.Message)" }

# ── 来源 2：ComposioHQ/awesome-claude-skills 社区精选清单 ──
try {
    $raw = Invoke-WebRequest -Headers $headers 'https://raw.githubusercontent.com/ComposioHQ/awesome-claude-skills/master/README.md' -UseBasicParsing -TimeoutSec 30
    $n0 = $skills.Count
    foreach ($line in ($raw.Content -split "`n")) {
        # 匹配 "- [Name](url) - description *By [@author](...)*"
        if ($line -match '^\s*[-*]\s+\[([^\]]+)\]\((https://github\.com/[^)]+)\)\s*[-–—]\s*(.+?)\s*$') {
            $nm = $Matches[1]; $u = $Matches[2]; $ds = $Matches[3]
            if ($u -match '^https://github\.com/([^/]+/[^/]+)') { $rp = $Matches[1] } else { continue }
            if ($rp -eq 'anthropics/skills') { continue }   # 官方已在来源1收录
            $ds = ($ds -replace '\*By \[@[^\]]+\]\([^)]+\)\*', '' -replace '\*+', '').Trim()
            $skills += [ordered]@{
                name   = $nm
                repo   = $rp
                url    = $u
                desc   = if ($ds.Length -gt 300) { $ds.Substring(0,300) + '…' } else { $ds }
                source = 'community'
            }
        }
    }
    Write-Output "社区 skills: $($skills.Count - $n0) 个"
} catch { Write-Warning "awesome-claude-skills 抓取失败: $($_.Exception.Message)" }

# ── 来源 3：高星 skills 仓库本身（从 awesome 清单里的 repo 级条目已覆盖，这里补热门搜索）──
try {
    $r = Invoke-RestMethod -Headers $headers 'https://api.github.com/search/repositories?q=skills+topic:claude-skills&sort=stars&per_page=15' -TimeoutSec 30
    $have = @($skills | ForEach-Object { $_.repo })
    $n0 = $skills.Count
    foreach ($it in @($r.items)) {
        if ($have -contains $it.full_name) { continue }
        $skills += [ordered]@{
            name   = $it.name
            repo   = $it.full_name
            url    = $it.html_url
            desc   = $it.description
            source = 'repo'
            stars  = [int]$it.stargazers_count
        }
    }
    Write-Output "仓库级 skills: $($skills.Count - $n0) 个"
} catch { Write-Warning "skills 仓库搜索失败: $($_.Exception.Message)" }

# 仓库级条目补 stars 字段缺失
foreach ($s in $skills) { if (-not $s.PSObject.Properties['stars']) { $s | Add-Member -NotePropertyMembers @{ stars = $null } -Force } }

$out = [ordered]@{
    updated = $now.ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ssZ')
    count   = $skills.Count
    skills  = $skills
}
$json = $out | ConvertTo-Json -Depth 5 -Compress
[System.IO.File]::WriteAllText((Join-Path $PSScriptRoot 'skills.json'), $json, (New-Object System.Text.UTF8Encoding $false))
Write-Output "skills.json: 共 $($out.count) 条 @ $($out.updated)"
