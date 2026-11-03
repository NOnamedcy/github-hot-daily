# github-hot-daily 数据刷新脚本
# 本地与 GitHub Actions 通用（ubuntu runner 自带 pwsh）
$ErrorActionPreference = 'Stop'

$headers = @{ 'User-Agent' = 'github-hot-daily' }
if ($env:GITHUB_TOKEN) { $headers['Authorization'] = "Bearer $($env:GITHUB_TOKEN)" }

$now = Get-Date

function Get-Search([string]$q) {
    $url = "https://api.github.com/search/repositories?q=$([uri]::EscapeDataString($q))&sort=stars&order=desc&per_page=40"
    (Invoke-RestMethod -Headers $headers -Uri $url -TimeoutSec 60).items
}

function Convert-Item($it) {
    $created = [datetime]$it.created_at
    $months = [math]::Max(0.5, ($now - $created).TotalDays / 30.44)
    [ordered]@{
        name    = $it.full_name
        url     = $it.html_url
        stars   = [int]$it.stargazers_count
        created = $created.ToString('yyyy-MM-dd')
        lang    = $it.language
        desc    = $it.description
        monthly = [int][math]::Round($it.stargazers_count / $months)
    }
}

$dYear = $now.AddDays(-365).ToString('yyyy-MM-dd')
$d3m   = $now.AddDays(-100).ToString('yyyy-MM-dd')

$rising   = @(Get-Search "created:>$dYear stars:>3000" | ForEach-Object { Convert-Item $_ })
$boom   = @(Get-Search "created:>$d3m stars:>1000"   | ForEach-Object { Convert-Item $_ })
$evergreen = @(Get-Search "stars:>40000" | ForEach-Object { Convert-Item $_ })

$data = [ordered]@{
    updated = $now.ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ssZ')
    lists   = [ordered]@{
        rising    = $rising
        boom      = $boom
        evergreen = $evergreen
    }
}

$out = Join-Path $PSScriptRoot 'data.json'
$json = $data | ConvertTo-Json -Depth 5 -Compress
[System.IO.File]::WriteAllText($out, $json, (New-Object System.Text.UTF8Encoding $false))
Write-Output "data.json: rising=$($rising.Count) boom=$($boom.Count) evergreen=$($evergreen.Count) @ $($data.updated)"
