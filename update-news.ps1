# AI 资讯汇总刷新脚本：抓取 6 个免费公开源，机翻为中英对照，写入 news.json
$ErrorActionPreference = 'Stop'
$headers = @{ 'User-Agent' = 'Mozilla/5.0 github-hot-daily' }
$now = Get-Date
$sections = @()

function Strip-Html([string]$s, [int]$max = 140) {
    if ([string]::IsNullOrWhiteSpace($s)) { return '' }
    $t = $s -replace '<[^>]+>', ' '
    $t = $t -replace '&nbsp;', ' ' -replace '&amp;', '&' -replace '&lt;', '<' -replace '&gt;', '>' -replace '&quot;', '"' -replace '&#39;', "'"
    $t = ($t -replace '\s+', ' ').Trim()
    if ($t.Length -gt $max) { $t = $t.Substring(0, $max) + '…' }
    return $t
}

# —— 免费机翻（Google gtx 端点）+ 磁盘缓存，避免重复翻译 ——
$cachePath = Join-Path $PSScriptRoot 'translations.json'
$script:cache = @{}
if (Test-Path $cachePath) {
    try {
        $obj = (Get-Content $cachePath -Raw -Encoding UTF8) | ConvertFrom-Json
        foreach ($p in $obj.PSObject.Properties) { $script:cache[$p.Name] = $p.Value }
    } catch { Write-Warning "翻译缓存读取失败，将从零开始" }
}
function Is-CJK([string]$s) { return [regex]::IsMatch($s, '[一-鿿]') }
# RSS 字段取文本：兼容纯文本节点与 CDATA 包裹（PS 5.1 直接 [string] 转换会变成类型名）
function Rss-Text($node) {
    if ($null -eq $node) { return '' }
    if ($node -is [string]) { return $node }
    if ($node.PSObject.Properties['#cdata-section'] -and $node.'#cdata-section') { return [string]$node.'#cdata-section' }
    return [string]$node.InnerText
}
function Translate-Text([string]$s, [string]$tl) {
    if ([string]::IsNullOrWhiteSpace($s)) { return '' }
    $key = "$tl|$s"
    if ($script:cache.ContainsKey($key)) { return $script:cache[$key] }
    $t = ''
    # 1) Google gtx（GitHub runner 上通常可用）
    try {
        $q = [uri]::EscapeDataString($s)
        $r = Invoke-RestMethod -Headers $headers "https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=$tl&dt=t&q=$q" -TimeoutSec 20
        $t = (($r[0] | ForEach-Object { $_[0] }) -join '').Trim()
    } catch { Write-Warning "gtx 翻译失败($tl): $($_.Exception.Message)" }
    # 2) MyMemory 兜底
    if (-not $t) {
        try {
            $pair = "en|$tl"; if ($tl -eq 'en') { $pair = 'zh-CN|en' }
            $q = [uri]::EscapeDataString($s)
            $r = Invoke-RestMethod -Headers $headers "https://api.mymemory.translated.net/get?q=$q&langpair=$pair" -TimeoutSec 20
            if ("$($r.responseStatus)" -eq '200') { $t = [string]$r.responseData.translatedText }
        } catch { Write-Warning "mymemory 翻译失败($tl): $($_.Exception.Message)" }
    }
    if ($t) {
        $script:cache[$key] = $t
        Start-Sleep -Milliseconds 120
    }
    return $t
}

# 0) 观猹热门 AI 产品榜（watcha.cn 公开 JSON，中文优先排最前）
try {
    $wc = Invoke-RestMethod -Headers $headers 'https://watcha.cn/api/v2/hot/products?limit=15' -TimeoutSec 30
    $items = @($wc.data.items | Select-Object -First 15 | ForEach-Object {
        $st = $_.stats
        $metaBits = @()
        if ($st.score) { $metaBits += "评分 $([math]::Round($st.score, 1))" }
        if ($st.upvotes) { $metaBits += "👍 $($st.upvotes)" }
        if ($st.review_count) { $metaBits += "$($st.review_count) 条评测" }
        [ordered]@{
            title   = $_.name
            url     = "https://watcha.cn/products/$($_.slug)"
            summary = Strip-Html $_.slogan 140
            meta    = "观猹热榜 · $($metaBits -join ' · ')"
        }
    })
    if ($items.Count) { $sections += [ordered]@{ id = 'watcha'; title = '🔥 观猹 AI 产品热榜（watcha.cn · 中文优先）'; items = $items } }
} catch { Write-Warning "观猹抓取失败: $($_.Exception.Message)" }

# 1) HuggingFace 每日论文
try {
    $hf = Invoke-RestMethod -Headers $headers 'https://huggingface.co/api/daily_papers' -TimeoutSec 30
    $items = @($hf | Select-Object -First 15 | ForEach-Object {
        $p = $_.paper
        [ordered]@{
            title   = $p.title
            url     = "https://huggingface.co/papers/$($p.id)"
            summary = Strip-Html $p.summary 160
            meta    = "👍 $($p.upvotes) · $(([datetime]$_.publishedAt).ToString('MM-dd'))"
        }
    })
    if ($items.Count) { $sections += [ordered]@{ id = 'papers'; title = '🤗 今日 AI 论文（HuggingFace Daily Papers）'; items = $items } }
} catch { Write-Warning "HF papers 抓取失败: $($_.Exception.Message)" }

# 2) Hacker News AI 热帖（近 7 天、30 分以上，按分数排序）
try {
    $weekAgo = [int]([DateTimeOffset]$now.AddDays(-7)).ToUnixTimeSeconds()
    $hn = Invoke-RestMethod -Headers $headers "https://hn.algolia.com/api/v1/search?query=AI&tags=story&numericFilters=points%3E30,created_at_i%3E$weekAgo&hitsPerPage=30" -TimeoutSec 30
    $items = @($hn.hits | Sort-Object points -Descending | Select-Object -First 15 | ForEach-Object {
        $u = $_.url
        if (-not $u) { $u = "https://news.ycombinator.com/item?id=$($_.objectID)" }
        $d = [DateTimeOffset]::FromUnixTimeSeconds([int]$_.created_at_i).ToString('MM-dd')
        [ordered]@{
            title   = $_.title
            url     = $u
            summary = ''
            meta    = "$($_.points) 分 · $($_.num_comments) 评论 · $d"
        }
    })
    if ($items.Count) { $sections += [ordered]@{ id = 'hn'; title = '🔥 海外热点（Hacker News 近 7 天 AI 热帖）'; items = $items } }
} catch { Write-Warning "HN 抓取失败: $($_.Exception.Message)" }

# 3) 量子位 RSS
try {
    $x = [xml](Invoke-WebRequest -Headers $headers 'https://www.qbitai.com/feed' -UseBasicParsing -TimeoutSec 30).Content
    $items = @($x.rss.channel.item | Select-Object -First 12 | ForEach-Object {
        [ordered]@{
            title   = [string]$_.title
            url     = [string]$_.link
            summary = Strip-Html (Rss-Text $_.description) 140
            meta    = "量子位 · $(([datetime]$_.pubDate).ToString('MM-dd'))"
        }
    })
    if ($items.Count) { $sections += [ordered]@{ id = 'qbitai'; title = '📰 中文资讯（量子位）'; items = $items } }
} catch { Write-Warning "量子位抓取失败: $($_.Exception.Message)" }

# 4) Google News 中文「人工智能」近 1 天
try {
    $x = [xml](Invoke-WebRequest -Headers $headers 'https://news.google.com/rss/search?q=%E4%BA%BA%E5%B7%A5%E6%99%BA%E8%83%BD%20when:1d&hl=zh-CN&gl=CN&ceid=CN:zh-Hans' -UseBasicParsing -TimeoutSec 30).Content
    $items = @($x.rss.channel.item | Select-Object -First 15 | ForEach-Object {
        $src = [string]$_.source.'#text'
        $t = [string]$_.title
        if ($src -and $t.EndsWith(" - $src")) { $t = $t.Substring(0, $t.Length - $src.Length - 3) }
        [ordered]@{
            title   = $t
            url     = [string]$_.link
            summary = ''
            meta    = "$src · $(([datetime]$_.pubDate).ToString('MM-dd HH:mm'))"
        }
    })
    if ($items.Count) { $sections += [ordered]@{ id = 'gn'; title = '🌐 中文聚合（Google News · 近 24 小时）'; items = $items } }
} catch { Write-Warning "Google News 抓取失败: $($_.Exception.Message)" }

# 5) DeepMind 博客（近 30 天，兜底取最新 8 条）
try {
    $x = [xml](Invoke-WebRequest -Headers $headers 'https://deepmind.google/blog/rss.xml' -UseBasicParsing -TimeoutSec 30).Content
    $all = @($x.rss.channel.item)
    $recent = @($all | Where-Object { ([datetime]$_.pubDate) -gt $now.AddDays(-30) } | Select-Object -First 8)
    if (-not $recent.Count) { $recent = @($all | Select-Object -First 8) }
    $items = @($recent | ForEach-Object {
        [ordered]@{
            title   = [string]$_.title
            url     = [string]$_.link
            summary = Strip-Html (Rss-Text $_.description) 140
            meta    = "DeepMind · $(([datetime]$_.pubDate).ToString('yyyy-MM-dd'))"
        }
    })
    if ($items.Count) { $sections += [ordered]@{ id = 'deepmind'; title = '🧠 DeepMind 官方博客（近 30 天）'; items = $items } }
} catch { Write-Warning "DeepMind 抓取失败: $($_.Exception.Message)" }

# —— 中英对照：中文条目补英文，英文条目补中文 ——
foreach ($sec in $sections) {
    foreach ($it in $sec.items) {
        if (Is-CJK $it.title) { $it.title_alt = Translate-Text $it.title 'en' }
        else                  { $it.title_alt = Translate-Text $it.title 'zh-CN' }
        if ($it.summary) {
            if (Is-CJK $it.summary) { $it.summary_alt = Translate-Text $it.summary 'en' }
            else                    { $it.summary_alt = Translate-Text $it.summary 'zh-CN' }
        }
    }
}
[System.IO.File]::WriteAllText($cachePath, ($script:cache | ConvertTo-Json -Depth 4 -Compress), (New-Object System.Text.UTF8Encoding $false))

$out = [ordered]@{
    updated  = $now.ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ssZ')
    sections = $sections
}
$json = $out | ConvertTo-Json -Depth 6 -Compress
[System.IO.File]::WriteAllText((Join-Path $PSScriptRoot 'news.json'), $json, (New-Object System.Text.UTF8Encoding $false))
$total = ($sections | ForEach-Object { $_.items.Count } | Measure-Object -Sum).Sum
Write-Output "news.json: $($sections.Count) 个栏目, 共 $total 条 @ $($out.updated)"
