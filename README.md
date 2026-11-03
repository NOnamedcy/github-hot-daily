# GitHub 热门项目雷达

每日自动更新的 GitHub 热门项目榜单网页：

- 🔥 年度涨星榜：近一年创建的高星项目（按总星数排序，附月均涨星估算）
- 🚀 近三月爆发榜：近 100 天创建的新锐项目
- 🏛️ 长青经典榜：全站星数 TOP 40
- 📖 能力详解：人工策展的项目能力说明（基于各项目 README 提炼）与领域速查

**在线访问**：https://nonamedcy.github.io/github-hot-daily/

## 工作原理

- `index.html`：纯静态单页，浏览器端读取 `data.json` / `taglines.json` / `capabilities.md` 渲染，无后端。
- `update.ps1`：PowerShell 脚本，调用 GitHub Search API 刷新三榜数据写入 `data.json`（本地手动跑：`pwsh ./update.ps1`）。
- `.github/workflows/daily.yml`：GitHub Actions 每日 UTC 02:00（北京时间 10:00）自动运行更新脚本并提交，也可在 Actions 页面手动触发。

## 文件说明

| 文件 | 作用 | 更新方式 |
|---|---|---|
| `data.json` | 三榜星数数据 | 每日自动 |
| `taglines.json` | 项目中文一句话简介 | 人工策展 |
| `capabilities.md` | 能力详解/领域速查/跟踪方法 | 人工策展 |

数据为采集时点快照，月均涨星 = 总星数 ÷ 仓库月龄，仅供粗略参考。
