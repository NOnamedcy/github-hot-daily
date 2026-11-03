# 能力详解（按领域分组）

> 以下内容基于各项目 README 实际提炼（2026-11-03），非凭印象。

### A. Agent 技能（Skills）生态

**[anthropics/skills](https://github.com/anthropics/skills)** · 186,856★
- 能力：Anthropic 官方技能仓库，教 Claude 以可复用方式完成专门任务——按公司品牌规范做文档、按组织流程分析数据、自动化个人事务
- 关键特性：技能=指令+脚本+资源的文件夹，动态加载；配套 agentskills.io 标准；含大量官方示范技能
- 适合谁：想给 Claude 系 Agent 编写/复用技能的开发者

**[obra/superpowers](https://github.com/obra/superpowers)** · 311,355★
- 能力：给编程 Agent 装上完整的软件开发方法论——Agent 一看到你在做东西就不再上来就写代码，而是按流程走
- 关键特性：可组合技能+初始指令；支持 Claude Code / Codex / Cursor / Gemini CLI / Copilot CLI / Grok Build / Kimi Code / OpenCode / Hermes 等 18+ 宿主
- 适合谁：想让任何编程 Agent"有工程纪律"的人

**[mattpocock/skills](https://github.com/mattpocock/skills)** · 310,471★
- 能力：Matt Pocock 日常做真实工程（非 vibe coding）自用的技能集，30 秒装到项目里
- 关键特性：小而可组合、可改写成自己的；不接管流程（与 GSD/BMAD/Spec-Kit 相反），保留人的控制权；30 秒安装、可自动更新
- 适合谁：要"辅助而不代驾"的有经验工程师

**[affaan-m/ECC](https://github.com/affaan-m/ECC)** · 295,827★
- 能力：Agent 宿主性能优化系统——技能、直觉、记忆、安全、研究优先的开发流程
- 关键特性：覆盖 Claude Code / Codex / Opencode / Cursor 等；有 npm 包 ecc-universal / ecc-agentshield、GitHub App 与插件形态；官方强调只从验证渠道安装防供应链投毒
- 适合谁：重度使用多家编程 Agent、想要统一增强层的团队

**[multica-ai/andrej-karpathy-skills](https://github.com/multica-ai/andrej-karpathy-skills)** · 228,660★
- 能力：一个 CLAUDE.md 文件，纠正 LLM 编程的经典毛病——不验证假设就往下跑、过度复杂化、不清理死代码、该反驳时不反驳
- 关键特性：单文件即插即用；源自 Karpathy 对 LLM 编程缺陷的公开总结
- 适合谁：所有 Claude Code 用户的最小成本增强

**[nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)** · 144,402★
- 能力：给 AI 编程助手注入专业 UI/UX 设计智能，跨平台跨框架生成专业界面
- 关键特性：v2.0 旗舰功能是智能设计系统生成；多语言文档
- 适合谁：用 AI 做产品界面但嫌输出"太模板"的人

**[Leonxlnx/taste-skill](https://github.com/Leonxlnx/taste-skill)** · 108,928★
- 能力：让编程 Agent 做"有品味"的网页/App 界面——给 Agent 美术指导、真实参考图，并要求它在真实浏览器里自检作品
- 关键特性：`npx skills add` 一键装；参考图来自开放档案馆并标注署名
- 适合谁：想摆脱"AI 味落地页"的开发者

**[Imbad0202/academic-research-skills](https://github.com/Imbad0202/academic-research-skills)** · 55,087★
- 能力：学术研究全流程技能：选题 → 写作 → 评审 → 修改 → 定稿，含 /ars-plan 苏格拉底式对话梳理论文结构
- 关键特性：30 秒经 Claude Code 插件市场安装；支持 CLI/VS Code/JetBrains；多语言
- 适合谁：研究生、科研写作者

**[hardikpandya/stop-slop](https://github.com/hardikpandya/stop-slop)** · 18,565★
- 能力：教 Claude 或任何 LLM 识别并删除"AI 腔"——可预测的短语、结构、节奏
- 关键特性：SKILL.md 核心规则 + phrases/structures/examples 三份参考文件；可用于 Claude Code/Projects/自定义指令/API 系统提示词
- 适合谁：用 AI 写正式文字、要去掉 AI 味的人

### B. Agent 平台与编程宿主

**[deepseek-ai/deepseek-harness](https://github.com/deepseek-ai/deepseek-harness)** · 270,000★
- 能力：DeepSeek 官方开源 Agent 宿主，"万物皆插件"架构（基于 Cordis 时空可组合编程范式）——模型、工具、沙箱、会话存储、UI 甚至 Agent 循环本身都是插件
- 关键特性：`npx @deepseek-ai/dsh web` 一键启动 Web UI（默认 127.0.0.1:3080）；插件可扩展官方编程 Agent 或组装全新形态
- 适合谁：想要可深度定制的开源 Agent 底座的开发者（注意：开发者预览版，有破坏性变更）

**[openclaw/openclaw](https://github.com/openclaw/openclaw)** · 393,784★
- 能力：跑在自己电脑上的开源 AI 助手，进驻你已有的聊天渠道：Discord、iMessage、Slack、Teams、Telegram、WhatsApp 等 20+，另有 macOS/iOS/Android/Windows/Linux 原生 App
- 关键特性：状态/记忆/凭据全在本地；模型与 Agent 宿主（Claude、Codex、本地模型）是可插拔替换的；默认不向任何第三方回传数据；个人笔记本与团队部署共用一套 Gateway
- 适合谁：想要隐私自主、跨聊天软件的个人 AI 助手

**[anomalyco/opencode](https://github.com/anomalyco/opencode)** · 224,166★
- 能力：开源编程 Agent，全包管理器安装（npm/brew/pacman/nix/mise 等）
- 关键特性：多语言文档；一行 curl 或 brew 安装；活跃迭代（默认分支 dev）
- 适合谁：要终端优先、可自托管编程 Agent 的开发者

**[NousResearch/hermes-agent](https://github.com/NousResearch/hermes-agent)** · 259,947★
- 能力：Nous Research 的自进化 Agent——内置学习循环：从经验创建技能、使用中改进技能、主动沉淀知识、检索自己的历史会话、跨会话构建用户画像
- 关键特性：跑在 $5 VPS 到 GPU 集群均可，闲置近零成本；可从 Telegram 遥控云端 VM 上的它；模型任意切换（Nous Portal/OpenRouter/OpenAI/自建端点）无锁定；完整 TUI
- 适合谁：想要"越用越懂你"的长期个人 Agent

**[stablyai/orca](https://github.com/stablyai/orca)** · 113,811★
- 能力：多 Agent 编排台：并排跑 Codex / Claude Code / OpenCode / Pi，每个 Agent 独立 git worktree、统一跟踪
- 关键特性：手机 App 监控与指挥 Agent（完成推送+远程追加指令）；一条提示词扇出给 5 个 Agent 比稿择优合并；WebGL 终端分屏；设计模式可点选真实 Chromium 里的 UI 元素发给 Agent
- 适合谁：同时驾驭多个编程 Agent 的"100x builder"

**[odysseus-dev/odysseus](https://github.com/odysseus-dev/odysseus)** · 94,965★
- 能力：自托管 AI 工作台：聊天、Agent、研究、文档、邮件、笔记、日历、本地模型工作流一体
- 关键特性：`docker compose up` 一条命令起全栈（端口 7011）；官方多架构镜像 CI 直发
- 适合谁：要把个人 AI 基础设施整体自托管的人

**[Twigpine/openclaude](https://github.com/Twigpine/openclaude)** · 34,258★
- 能力：开源编程 Agent CLI，一个终端工作流接所有后端：OpenAI 兼容 API、Gemini、GitHub Models、Codex OAuth、Ollama 等
- 关键特性：提示词/工具/子 Agent/MCP/斜杠命令/流式输出全家桶；/provider 引导式配置与档案保存；有 VS Code 扩展
- 适合谁：不想被单一供应商 CLI 绑死的人

**[herdrdev/herdr](https://github.com/herdrdev/herdr)** · 47,666★
- 能力：编程 Agent 的运行时底座：关掉客户端/SSH 掉线 Agent 继续跑，重启后恢复布局并恢复会话
- 关键特性：多台机器一个窗口统一管理；每个窗格标注工作中/阻塞/空闲，Agent 卡住会主动报告
- 适合谁：在多机器上长跑 Agent 任务的人

**[xai-org/grok-build](https://github.com/xai-org/grok-build)** · 27,664★
- 能力：SpaceXAI 的终端 AI 编程 Agent：全屏 TUI 理解代码库、编辑文件、执行 shell、联网搜索、管理长任务
- 关键特性：Rust 编写；支持交互、headless 脚本/CI、经 ACP 协议嵌入编辑器三种模式；从 SpaceXAI monorepo 定期同步
- 适合谁：Grok 生态用户、TUI 爱好者

**[yetone/magpie](https://github.com/yetone/magpie)** · 28,661★
- 能力：菜单栏里的模型网关：Claude Code 用 Kimi、Codex 用 DeepSeek、Gemini CLI 用 GLM——任意 Agent 配任意模型，一处切换
- 关键特性：一个本地网关服务所有 Agent；某账号配额耗尽自动切换到下一个账号
- 适合谁：手握多个模型订阅、想在各 Agent 间自由调配的人

**[steipete/CodexBar](https://github.com/steipete/CodexBar)** · 22,962★
- 能力：macOS 菜单栏显示各 AI 编程供应商的额度用量与重置倒计时（Codex、Claude Code 等）
- 关键特性：无需登录即可看用量；每供应商一个状态图标或可合并；另有 Linux 桌面版（用量/花费窗口、通知、托盘）
- 适合谁：要规划长任务避开额度重置的重度用户

### C. 代码理解 / 逆向 / 设计

**[morluto/rea](https://github.com/morluto/rea)** · 423,819★
- 能力：逆向工程专用 MCP：看见别家 App 的某个功能，让 Agent 把它逆向理解到二进制层级；可分析二进制、应用程序与运行时行为
- 关键特性：`npx rea-agents setup` 一键接入；可构建 RL 训练环境；官方提醒只从 morluto/rea、rea.tools、rea-agents npm 包安装（有仿冒仓库）
- 适合谁：安全研究、竞品分析、二进制逆向工程师

**[Egonex-AI/Understand-Anything](https://github.com/Egonex-AI/Understand-Anything)** · 90,028★
- 能力：把任意代码库/知识库/文档变成可交互知识图谱：多 Agent 流水线分析项目里每个文件、函数、类、依赖，给你可视化仪表盘探索+问答
- 关键特性：Claude Code 插件形态，兼容 Codex/Cursor/Copilot/Gemini CLI；专治"刚加入团队面对 20 万行代码无从下手"
- 适合谁：接屎山、 onboarding 新人、做代码考古

**[abhigyanpatwari/GitNexus](https://github.com/abhigyanpatwari/GitNexus)** · 48,229★
- 能力：零服务器代码智能引擎：把代码库索引成符号/调用/依赖/执行流知识图谱
- 关键特性：`npx gitnexus analyze` 建索引并自动安装 Agent 技能、注册 Claude Code hooks、生成 AGENTS.md/CLAUDE.md；经 MCP 接各编辑器；有 Web 图谱浏览器
- 适合谁：想让 Agent 真正"看懂"代码库结构的人

**[nexu-io/open-design](https://github.com/nexu-io/open-design)** · 105,577★
- 能力：协作式 AI 设计工作台：从简报出发，用编程 Agent 或内建能力做动效、原型、网站、App、仪表盘、演示文稿、图片和视频，团队在同一工作区反馈迭代
- 关键特性：本地优先+开源；云版 OpenDesign Go 积分制，个人计划含 Codex/Claude Code/DSH/OpenCode 的 API 访问
- 适合谁：设计+开发混合团队

**[JCodesMore/ai-website-cloner-template](https://github.com/JCodesMore/ai-website-cloner-template)** · 38,464★
- 能力：给编程 Agent 一个 URL，把网站重建成干净的 Next.js 应用
- 关键特性：模板工程，Agent 自己完成克隆/装依赖/自检；官方称 Claude Code + Opus 5.5 效果最好，也支持 Codex/Cursor/OpenCode
- 适合谁：快速建站、参考重构现有站点

**[google-research/harness2](https://github.com/google-research/harness2)** · 22,177★
- 能力：Google Research 的递归 Agent 宿主优化框架：在开放世界里自动优化"宿主"（提示词/工具/记忆/技能/编排）而不动模型权重
- 关键特性：任务级递归（Propose–Probe–Compose 对比式改进）+ 宿主级递归双层结构；无需 ground-truth 反馈
- 适合谁：Agent 研究者和需要自动调优 Agent 系统的团队

**[hypit-ai/hypit](https://github.com/hypit-ai/hypit)** · 27,612★
- 能力：给 AI Agent 一套"视频创作语言"：丢进一个爆款视频，Agent 按完整工作流克隆——素材、字幕、B-roll、特效以"词"而非"秒"为锚点，一条命令出 100 个变体
- 关键特性：也可从模板或纯文字描述起步；生成模型可选，工作流可纯代码渲染
- 适合谁：短视频矩阵运营、增长团队

**[wheresryan22/anatomy](https://github.com/wheresryan22/anatomy)** · 24,193★
- 能力：Claude 技能：把技术概念"造"成一个可运转的实体来讲解——如用弹子锁讲缓存键、用龙门吊讲 GPU 上下文；产出精致可交互的等距插图（SVG + WebGL 着色器 + 3D）
- 关键特性：兼容 Claude Code/Antigravity/OpenCode/Codex/MiniMax Code
- 适合谁：做技术写作、教学、演示的人

### D. 语音 / 多媒体 / 本地推理 / 感知

**[microsoft/VibeVoice](https://github.com/microsoft/VibeVoice)** · 55,105★
- 能力：微软开源语音 AI 家族：流式 ASR（边说边转写"谁说了什么"，支持热词定制，10 种语言）、边缘 CPU 推理引擎 ASR-BitNet（4.62GB 压到 1.58GB 实时推理）
- 关键特性：已接入 Azure AI Foundry Labs 与 Hugging Face Transformers
- 适合谁：做语音识别/语音应用的团队

**[debpalash/VoiceStudio](https://github.com/debpalash/VoiceStudio)** · 99,309★
- 能力：全本地 AI 语音工作室：声音克隆、语音设计（文字描述生成嗓音）、视频配音（对齐原片时轴）、听写转写、有声书制作，646 种语言
- 关键特性：跑在笔记本/桌面/服务器/手机；按需下载模型包；浮动听写小部件
- 适合谁：替代 ElevenLabs 且要数据不出本机的创作者

**[ruvnet/RuView](https://github.com/ruvnet/RuView)** · 102,142★
- 能力：把普通 WiFi 信号变成空间感知系统：隔墙、黑暗中检测人体、测呼吸心率、追踪移动——零摄像头零穿戴，纯物理
- 关键特性：原生对接 Home Assistant（一个 --mqtt 参数）、Apple Home/HomePod（HAP 桥）、Google Home/Alexa（Matter）；Siri/小爱同学级语音播报各房间在场与体征
- 适合谁：智能家居、养老监护、无摄像头感知场景

**[JustVugg/colibri](https://github.com/JustVugg/colibri)** · 46,729★
- 能力：纯 C、零依赖、无需 GPU 在普通电脑上跑数千亿参数 MoE 大模型——每 token 只激活的小部分驻内存，专家权重按需从磁盘流式加载
- 关键特性：一个模型家族一个 C 文件；已支持 GLM-5.2/5.3、Kimi K3、DeepSeek V4.1 Flash、Qwen3.8-Flash-Next、MiMo-V2.6 等 13 个引擎
- 适合谁：无显卡想跑前沿 MoE 模型的人

**[Niko1221/Strata](https://github.com/Niko1221/Strata)** · 38,656★
- 能力：消费级硬件一键跑 Qwen3.8-Flash-Next：Windows/Linux 一键安装，本地聊天/编程/图像理解
- 关键特性：本地起 OpenAI/Anthropic 兼容 API；多量化供应商可选（ISTA-DASLab 推荐 Q2_0 起步，Unsloth 到 Q8_0）；免账号
- 适合谁：个人电脑本地部署前沿模型

**[AlexsJones/llmfit](https://github.com/AlexsJones/llmfit)** · 38,586★
- 能力：检测你的 CPU/内存/GPU/VRAM/加速器，一条命令告诉你哪些开源 LLM 跑得动、选什么量化
- 关键特性：TUI 内置基准实测并把真实 tok/s 回传项目（无需 gh CLI），同硬件用户直接看实测值
- 适合谁：买卡前评估、本地部署选型

**[baidu/Unlimited-OCR](https://github.com/baidu/Unlimited-OCR)** · 30,416★
- 能力：百度"无限长程"文档解析：Unlimited OCR 2 用 SR-SWA 实现 unlimited-horizon 解析，配套 MarathonDocBench 超长文档基准
- 关键特性：模型已上 ModelScope/百度云；ms-swift 支持训练；arXiv 论文已发布（2026-11-02）
- 适合谁：长文档/书籍级 OCR 与文档理解

**[storytold/photocraft](https://github.com/storytold/photocraft)** · 76,311★
- 能力：纯 Rust 净室重写的开源 Photoshop：图层、蒙版、调整图层、图层样式、文字、矢量、画笔，读写真实 PSD
- 关键特性：原生应用、离线可用；同属 ArtCraft 开源创作套件
- 适合谁：要免费专业图像编辑的各平台用户

**[storytold/pdfcraft](https://github.com/storytold/pdfcraft)** · 19,283★
- 能力：纯 Rust 现代 PDF 工作台：阅读、整理、合并、拆分、加密保护 PDF
- 关键特性：macOS/Windows/Linux/FreeBSD/Web 全平台；表单与图层支持；线程化批注
- 适合谁：替代 Acrobat 的轻量选择

**[robbietilton/Compositor](https://github.com/robbietilton/Compositor)** · 18,388★
- 能力：Mac 上免费开源的 Photoshop 替代，围绕合成与后期工作流设计：图层/文件夹/不透明度等完整像素级工具
- 关键特性：开源 Xcode 工程可自行增删功能；brew 一键安装
- 适合谁：Mac 用户中的 PS 难民

**[boykopovar/AnyPS5](https://github.com/boykopovar/AnyPS5)** · 50,760★
- 能力：把 PS5 可执行文件自动移植到 Linux 和 Windows：重链接器转原生格式 + 系统 prx 库实现，无模拟器无独立运行时
- 关键特性：Web 转换器文件不出设备；relinker-only 构建可在 Apple Silicon macOS 跑
- 适合谁：主机游戏移植/研究圈

**[Gathin23/cleanyourtv](https://github.com/Gathin23/cleanyourtv)** · 50,628★
- 能力：通过 WiFi 给 Android/Google TV 去广告去臃肿，换成 Apple TV 风格的干净桌面；编程助手 15 分钟代劳
- 关键特性：三星/LG/Roku 等非安卓电视给出关追踪的遥控器操作指南；社区开发了手机/Mac/Windows 配套 App
- 适合谁：被智能电视广告折磨的用户

**[guillaumemeyer/watermarks-remover](https://github.com/guillaumemeyer/watermarks-remover)** · 26,043★
- 能力：隐私优先地剥离自有内容里的多厂商 AI 溯源标记：不可见 Unicode/异空格/bidi 字符（确定性脚本）、统计水印（Agent 改写）、文件级 C2PA/EXIF/XMP
- 关键特性：Agent 技能 + 纯标准库 Python 服务，技能经 HTTP 驱动服务、宿主无需 Python
- 适合谁：注重内容隐私卫生的用户（限自有内容）

**[img2threejs/img2threejs](https://github.com/img2threejs/img2threejs)** · 20,145★
- 能力：把参考图里的物体重建成纯代码的 Three.js 模型：程序化几何+生成着色器，带动画就绪、质量门控、token 高效
- 关键特性：不摄影测量、不抽 mesh、不下载素材包；画廊里每个模型都是浏览器里实时运行的生成代码
- 适合谁：前端 3D、创意编码

**[firecrawl/anydoc](https://github.com/firecrawl/anydoc)** · 23,321★
- 能力：Word/PPT/Excel/ODF/RTF/EPUB/CSV/PDF → 干净的 GitHub 风味 Markdown，毫秒级
- 关键特性：Rust 内核 + Node/Python/浏览器 WASM 绑定；以 Agent 技能形态发布；Firecrawl Parse 托管版含扫描件 OCR
- 适合谁：给 LLM 喂文档的每一个 Agent 项目

**[lexmount/moli](https://github.com/lexmount/moli)** · 22,312★
- 能力：为 AI Agent 打造的生产级无头浏览器：按需布局渲染，完整浏览器运行时+轻量资源占用；抓网页、抽内容、搜索、自动化
- 关键特性：Rust 编写；CLI/CDP/WebDriver Classic/BiDi 四种接口；全平台；提供现成 Agent 技能
- 适合谁：Agent 需要可靠浏览能力的开发者

**[browser-use/jev-ultrafast](https://github.com/browser-use/jev-ultrafast)** · 24,104★
- 能力：动态索引动作空间的浏览器 Agent：每次观察生成元素编号表，Agent 只挑"操作+元素"，小模型仅在输入文本时生成文字——苏黎世→伦敦订机票 7.1 秒
- 关键特性：Browser Use Cloud 全套餐可用 `model: "bu-ultrafast"`；号称最快最省
- 适合谁：大规模网页自动化任务

**[yt-dlp/yt-dlp](https://github.com/yt-dlp/yt-dlp)** · 204,833★
- 能力：命令行音/视频下载器，支持数千站点，youtube-dl 的活跃继承者
- 关键特性：丰富的格式选择/元数据/字幕/后处理能力；持续跟进各站反爬
- 适合谁：归档与离线观看

### E. 安全 / 基建 / 工具

**[usestrix/strix](https://github.com/usestrix/strix)** · 73,449★
- 能力：自主 AI 黑客对你的应用做渗透测试：动态运行代码、发现漏洞并用真实 PoC 验证，误报远低于静态扫描
- 关键特性：全套渗透工具链；与 GitHub Actions/CI/CD 集成，每个 PR 自动扫描并拦截不安全代码
- 适合谁：开发与的安全团队

**[NVIDIA/SkillSpector](https://github.com/NVIDIA/SkillSpector)** · 24,044★
- 能力：AI Agent 技能安全扫描器：安装技能前检测漏洞、恶意模式、提示注入、数据外泄、供应链风险（其研究数据集里 26.1% 技能含漏洞、5.2% 疑似恶意）
- 关键特性：NVIDIA Verified Skills 流水线组成部分，通过者签名进入官方技能目录
- 适合谁：技能生态所有用户与平台方

**[opensandbox-group/OpenSandbox](https://github.com/opensandbox-group/OpenSandbox)** · 16,409★
- 能力：在自有基础设施上给 AI Agent 提供隔离沙箱：执行代码、跑命令、管文件、操作浏览器或桌面
- 关键特性：本地 Docker 起步、K8s 统一部署 API；Firecracker 沙箱创建 P50 64ms、P99 125ms；支持暂停/恢复（内存磁盘状态保留）
- 适合谁：需要安全执行 Agent 代码的平台

**[volcengine/OpenViking](https://github.com/volcengine/OpenViking)** · 41,406★
- 能力：火山引擎开源的 Agent 上下文数据库：知识、记忆、技能统一成 viking:// 虚拟文件系统，Agent 用 ls/tree/read/write/grep 管理上下文，每个目录带自动摘要可先扫后读
- 关键特性：上下文透明可审可编辑（告别"embedding 黑箱"）；有 OpenViking Studio
- 适合谁：构建长期记忆 Agent 的团队

**[deepseek-ai/DeepInfer](https://github.com/deepseek-ai/DeepInfer)** · 25,062★
- 能力：DeepSeek 生产级大规模推理框架开源版（当前支持 DeepSeek-V4.1-Flash）
- 关键特性：FlashMLA/DeepGEMM/DeepEP 等优化内核；Attention DP/均衡 CP、MoE EP+EPLB 并行；DSpark 置信度调度验证加速解码；零开销异步批调度；批次不变推理与确定性采样
- 适合谁：自建 DeepSeek 模型推理服务的团队

**[NandhaKishorM/laya](https://github.com/NandhaKishorM/laya)** · 34,913★
- 能力：非自回归"系统 1"决策引擎：100+ 语言上单次前向 33ms 输出带类型的选择/评分/是否决策，RLCD（严格恰当评分规则强化学习）训练，路由器按请求选检查点
- 关键特性：pip 即装；可选 HTTP 服务、MCP、LangChain/LlamaIndex/CrewAI 集成、ONNX、TileLang GPU 加速
- 适合谁：需要毫秒级结构化决策做路由/分流/守门

**[n8n-io/n8n](https://github.com/n8n-io/n8n)** · 209,416★
- 能力：公平代码的 AI 工作流自动化平台：可视画布+自定义代码构建多步 Agent 与工作流
- 关键特性：1500+ 集成；模型无锁定（OpenAI/Anthropic/Google/开源模型随意换）；人工审批、全链路可观测；自托管或云
- 适合谁：从原型到生产的自动化团队

**[Open-Dev-Society/OpenStock](https://github.com/Open-Dev-Society/OpenStock)** · 21,071★
- 能力：免费开源的行情平台：实时价格跟踪、个性化提醒、公司深度信息
- 关键特性：可自托管全功能；社区运营非券商（数据或有延迟，非投资建议）
- 适合谁：不想付行情软件费的投资者

**[rmyndharis/OpenWA](https://github.com/rmyndharis/OpenWA)** · 16,470★
- 能力：免费开源自托管 WhatsApp API 网关
- 关键特性：可插拔架构：数据库（SQLite/PostgreSQL）、媒体存储（本地/S3）、可选 Redis（队列/限流/WebSocket 广播）全部配置化
- 适合谁：要掌控消息基础设施、拒绝供应商锁定的开发者

**[komi-store/komi-store](https://github.com/komi-store/komi-store)** · 20,267★
- 能力：跨平台开源应用商店：从 GitHub/Codeberg/Forgejo/Gitea 的 Release 直接发现并安装开源软件
- 关键特性：Kotlin 多平台（Android/Windows/macOS/Linux）；为"保持 Android 开放"运动发声
- 适合谁：开源软件重度用户

**[DuarteSantos8/openGym](https://github.com/DuarteSantos8/openGym)** · 18,949★
- 能力：自托管健身/自重训练追踪：5600+ 带动画演示的动作库、按肌肉地图检索、训练计划与记录
- 关键特性：PWA 可装主屏、passkey 登录、离线可用、手机电脑同步；可从 Strong/Hevy/FitNotes 导入；docker compose 一键起
- 适合谁：要数据自主的健身者

**[andrewyng/openworker](https://github.com/andrewyng/openworker)** · 18,878★
- 能力：Andrew Ng 背书的开源桌面 AI 同事：交付"完成的活"而非聊天——带修复方案的代码安全审查、润色好的文档、带数字的 Slack 回复、分诊好的收件箱；首发安全专员（防御者也该有 AI 杠杆）
- 关键特性：模型无锁定（BYOK 或 Ollama 全本地）；数据不出本机；开放 Beta 自动更新
- 适合谁：知识工作者日常任务外包

### F. 中文社区项目

**[hicccc77/WeFlow](https://github.com/hicccc77/WeFlow)** · 15,758★
- 能力：完全本地的微信聊天记录实时查看/分析/导出：朋友圈图片视频实况解密预览、防撤回、新消息弹窗（黑白名单）、私聊与群聊画像、年度/跨年报告、导出 HTML、开发者 HTTP API
- 关键特性：Windows/macOS/Linux 全平台；需自行设计配套原生解密组件
- 适合谁：想挖掘自己微信数据的人

**[NanmiCoder/cc-haha](https://github.com/NanmiCoder/cc-haha)** · 15,271★
- 能力：桌面端 Claude Code 工作台：多会话+全局搜索、Worktree 启动、Diff 审阅、图形化权限审批、模型自选（Claude/ChatGPT/Grok/本地端点）、生图、MCP 与 SubAgent 可视化管理、Agent Teams、Workflow 编排、Computer Use、技能市场、桌面宠物
- 关键特性：macOS/Windows/Linux + Android/iPhone App 扫码远程审批派任务；支持微信/飞书/钉钉/H5 远程接入
- 适合谁：Claude Code 重度用户

**[anywhere-labs/dsh-desktop](https://github.com/anywhere-labs/dsh-desktop)** · 34,600★
- 能力：DSH 的 Windows/macOS 开源桌面客户端：把本地 Web UI、Host 服务与插件系统集成进原生应用，固定并原样运行特定上游版本
- 关键特性：一键安装开箱即用（NSIS/DMG）；窗口/托盘/终端/更新/工作配置；声明与深度求索无隶属关系
- 适合谁：想要桌面形态 DSH 的用户

**[2025Emma/vibe-coding-cn](https://github.com/2025Emma/vibe-coding-cn)** · 23,129★
- 能力：中文 Vibe Coding 方法论指南：规划驱动+模块化的 AI 结对编程全流程（构思→选型→规划→开发→调试→扩展），核心理念"规划就是一切"，防 AI 失控把代码库搞成乱麻
- 关键特性：含元方法论（α-提示词生成器/Ω-提示词优化器的递归自我优化）
- 适合谁：中文开发者入门 AI 编程

**[eternity4719/HowToLiveBetter](https://github.com/eternity4719/HowToLiveBetter)** · 72,853★
- 能力：《高性价比人生指南》：767 条建议覆盖长寿防病、急救、省钱理财、法律红线、失业工伤、医保社保、恋爱婚育、育儿、创业合规、出国技能——每条写明成本/收益/证据等级，只引期刊论文与官方文件
- 关键特性：免费网页/EPUB/PDF/Anki 牌组；带在线检索页和 Claude Code/Codex 技能（问"替朋友担保签不签"会先查书再答）；生活自查找漏
- 适合谁：所有人（按中国大陆现行规定写）

**[Ebony-Vinyl/dsh-our-free-model](https://github.com/Ebony-Vinyl/dsh-our-free-model)** · 57,776★
- 能力：DSH 插件：装上即可免费不限量使用 DeepSeek V4.1 Flash、Kimi K3 等前沿模型——免登录、免注册、免 API Key
- 关键特性：上游来源公开（OpenCode Zen 网关、Kilo 公共网关直连）；模型清单跟随上游；可用性按本机网络出口实测；附 OpenAI 兼容本地转发端口；纯插件挂载零依赖；曾登 Trendshift JS 周榜第 1
- 适合谁：DSH 用户零成本用前沿模型

**[awesome-dsh-plugin/awesome-dsh-plugin](https://github.com/awesome-dsh-plugin/awesome-dsh-plugin)** · 22,098★
- 能力：DSH 社区插件精选列表，同时是插件市场索引（dsh 0.2.1+ 的 Plugins → Discover 可加索引源）
- 关键特性：所有插件可用 `dsh plugin add` 安装（声明 dsh.bundle 清单）
- 适合谁：DSH 生态玩家

### G. 长青经典（学习资源与基础设施）

- **[build-your-own-x](https://github.com/codecrafters-io/build-your-own-x)** 559k：汇集"从零实现 X"（数据库/操作系统/区块链/编辑器…）的教程索引，学原理的最佳路径。
- **[awesome](https://github.com/sindresorhus/awesome)** 530k：一切 awesome 列表的总目录，找任何领域优质资源的入口。
- **[public-apis](https://github.com/public-apis/public-apis)** 496k：分类整理的全网免费 API（天气/金融/政府/动物…），做 Demo 与产品的数据源宝库。
- **[freeCodeCamp](https://github.com/freeCodeCamp/freeCodeCamp)** 458k：完整的免费编程课程体系（前端/后端/数据分析/机器学习…）+ 可拿认证，代码即课程。
- **[free-programming-books](https://github.com/EbookFoundation/free-programming-books)** 401k：多语言免费编程书籍与课程索引。
- **[system-design-primer](https://github.com/donnemartin/system-design-primer)** 377k：系统设计学习地图：从 CDN、缓存、负载均衡到 CAP，含 Anki 记忆卡，面试架构题标配。
- **[developer-roadmap](https://github.com/nilbuild/developer-roadmap)** 371k：交互式开发者职业路线图（前端/后端/DevOps/AI…），点击节点看资源。
- **[coding-interview-university](https://github.com/jwasham/coding-interview-university)** 364k：作者进 Google 的完整自学计划：数据结构/算法/系统设计的数月打卡表。
- **[awesome-selfhosted](https://github.com/awesome-selfhosted/awesome-selfhosted)** 333k：可自建的 SaaS 替代清单（网盘/邮箱/密码/监控…），数字主权目录。
- **[awesome-python](https://github.com/vinta/awesome-python)** 332k：Python 各领域的框架/库/工具严选索引。
- **[project-based-learning](https://github.com/practical-tutorials/project-based-learning)** 289k：按语言分类的"动手做项目"教程合集。
- **[996.ICU](https://github.com/996icu/996.ICU)** 277k：2019 年反 996 加班运动的纪念仓库，开发者权益的文化符号。
- **[the-book-of-secret-knowledge](https://github.com/trimstray/the-book-of-secret-knowledge)** 255k：运维/安全向的清单、手册、速查表、一行流命令大宝库。
- **[linux](https://github.com/torvalds/linux)** 254k：Linux 内核源码本体（Linus 主仓库的镜像，PR 不收，纯阅读/克隆用）。
- **[react](https://github.com/react/react)** 252k：Meta 的声明式 UI 库，Web 与原生（React Native）界面的工业标准。
- **[TheAlgorithms/Python](https://github.com/TheAlgorithms/Python)** 226k：几乎所有经典算法的 Python 参考实现，教学友好。
- **[vue](https://github.com/vuejs/vue)** 213k：渐进式前端框架 Vue 2 仓库（Vue 3 在 vuejs/core）。
- **[ossu/computer-science](https://github.com/ossu/computer-science)** 211k：用免费公开课完整自学计算机科学本科的路径与课表。
- **[FreeDomain](https://github.com/DigitalPlatDev/FreeDomain)** 207k：免费域名注册服务+DNS 学习资源，让零成本拥有网站成为可能。
- **[n8n](https://github.com/n8n-io/n8n)** 209k：见 E 组详解。
- **[yt-dlp](https://github.com/yt-dlp/yt-dlp)** 205k：见 D 组详解。

---

# 按领域速查

- **Agent 技能生态**：anthropics/skills、superpowers、mattpocock/skills、ECC、karpathy-skills、taste-skill、ui-ux-pro-max、academic-research-skills、stop-slop、anatomy
- **Agent 平台/宿主**：deepseek-harness、dsh-desktop、openclaw、opencode、orca、hermes-agent、odysseus、cc-haha、openclaude、gbrain、herdr、grok-build、magpie、harness2、openworker
- **模型/推理**：DeepInfer、colibri、Strata、llmfit、laya
- **代码理解/逆向**：rea、Understand-Anything、GitNexus、ai-website-cloner-template
- **设计/创作**：open-design、photocraft、pdfcraft、Compositor、hypit、img2threejs
- **语音/文档/感知**：VibeVoice、VoiceStudio、Unlimited-OCR、anydoc、RuView
- **浏览器/Web 自动化**：chrome-devtools-mcp、moli、jev-ultrafast
- **安全**：strix、SkillSpector、watermarks-remover
- **Agent 基础设施**：OpenSandbox、OpenViking、CodexBar、dsh-our-free-model
- **生活/杂项**：WeFlow、cleanyourtv、AnyPS5、openGym、OpenStock、OpenWA、komi-store、HowToLiveBetter、FreeDomain
- **自动化**：n8n
- **学习资源**：build-your-own-x、freeCodeCamp、system-design-primer、developer-roadmap、free-programming-books、coding-interview-university、ossu/computer-science、project-based-learning、awesome 系

---

# 自己动手：跟踪涨星的方法

1. **GitHub Trending 页**：<https://github.com/trending?since=weekly>（日/周/月三档，可按语言过滤）
2. **Search API 查询式**（无需登录，限流 10 次/分钟）：
   - 近一年新项目涨星榜：`https://api.github.com/search/repositories?q=created:>2025-06-01&sort=stars&order=desc`
   - 近三月爆发榜：`https://api.github.com/search/repositories?q=created:>2026-07-01&sort=stars&order=desc`
   - 近期活跃高星：`https://api.github.com/search/repositories?q=pushed:>2026-10-01+stars:>10000&sort=stars&order=desc`
   - 按主题：`q=topic:mcp+created:>2026-01-01&sort=stars`
3. **趋势提示**：当前增长最猛的三条赛道：① Agent Skills 技能生态及其安全（SkillSpector 一类）；② 本地/自托管 AI 工作台与推理（colibri、Strata、DeepInfer）；③ "Agent 干活交付物"类应用（视频/设计/逆向）。长青榜仍被学习资源类长期霸占。