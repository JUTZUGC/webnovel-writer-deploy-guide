# Webnovel Writer 一键安装指南

> 第三方部署指南 · 非 Webnovel Writer 官方仓库。官方项目：[lingfengQAQ/webnovel-writer](https://github.com/lingfengQAQ/webnovel-writer)
> 内容来自官方文档（2026-10-31）。项目迭代快，请以[官方文档](https://lingfengqaq.github.io/webnovel-writer/docs/install.html)为准。

[![⚡ 一键安装](https://img.shields.io/badge/%E2%9A%A1_%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#一键安装推荐用百度搭子)

## 一键安装（推荐：用百度搭子）

> [!TIP]
> 要解决的不是「写不出来」，而是写到三百章时还记得住当初的设定、伏笔和大纲。

⚠️ 需要 Claude Code 与 Python 3.10+，通过插件市场安装，不用手动克隆。当前 master 分支是 v6（Claude Code 版，只修致命 bug）；v8 是基于 DeepSeek Harness 的写作工作台，安装方式不同，两者之间还没有验证过的迁书方案。AI 生成内容请自行核实事实与版权。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/webnovel-writer-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子会确认 Python 3.10+，从插件市场装好技能，再装齐依赖并初始化一本书，按它的提示确认即可，结束时它会告诉你结果。
   （需本机已装 Git；构建依赖以官方文档为准。）



## Webnovel Writer 是什么？

Webnovel Writer 是开源的从初始化设定、规划卷纲到写章审查与沉淀记忆，把长篇连载的一致性交给一套插件流程（协议：GPL-3.0，<img src="https://img.shields.io/github/stars/lingfengQAQ/webnovel-writer?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

面向长篇连载的创作流程插件：初始化设定、规划卷纲、逐章写作、自动审查、把关键信息沉淀成可检索的记忆，再用只读面板查看当前状态，保证几百章后设定不跑偏。

- 整条流程串好：设定到写章到审查都有
- 长期一致性：记忆沉淀，伏笔不丢
- 可查询状态：只读面板看当前进度
- 插件市场安装：一条命令，不用克隆
- 中文文档：新手教程与安装指南齐全
- GPL-3.0，可自行改造

（来源：[官方仓库](https://github.com/lingfengQAQ/webnovel-writer)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 7 | . |
| 一 | 条 |
| 记 | 忆 |
| 设 | 定 |
| 有 | 只 |
| G | P |

| 需要注意 | 说明 |
|---|---|
| 强 | 依 |
| 需 | 要 |
| v | 6 |
| v | 6 |
| 长 | 篇 |

> 以上基于官方文档与社区反馈整理（2026-10-31），以官方最新文档为准。

## 快速部署（官方方式）

```bash
claude plugin marketplace add lingfengQAQ/webnovel-writer --scope user
claude plugin install webnovel-writer@webnovel-writer-marketplace --scope user
python -m pip install -r https://raw.githubusercontent.com/lingfengQAQ/webnovel-writer/HEAD/requirements.txt
echo "安装完成：在 Claude Code 里按提示初始化一本书"
```

部署步骤来源：[https://github.com/lingfengQAQ/webnovel-writer#快速开始](https://github.com/lingfengQAQ/webnovel-writer#快速开始)

## 验证状态

| 场景 | 状态 |
|---|---|
| README 确认插件市场安装命令、Python 依赖与 v6 / v8 差异 | 已核对 2026-10-31 |
| README 确认默认分支为 master、许可证为 GPL-3.0 | 已核对 2026-10-31 |
| 未实测安装与初始化书籍 | 说明 2026-10-31 |
| MCP 冒烟：initialize / tools/list 返回 get_guide、search_guide、get_project_info | 已验证 2026-10-31 |
| 非目标宿主调用 get_guide 被拦截（HOST_NOT_ALLOWED） | 已验证 2026-10-31 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

项目本身不含 MCP；本仓库的 MCP 只提供安装步骤、版本差异与常见问题。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-10-31）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\webnovel-writer-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 三步装好

```bash
claude plugin marketplace add lingfengQAQ/webnovel-writer --scope user
claude plugin install webnovel-writer@webnovel-writer-marketplace --scope user
python -m pip install -r https://raw.githubusercontent.com/lingfengQAQ/webnovel-writer/HEAD/requirements.txt
```

只想在某个项目里用，把 `--scope user` 换成 `--scope project`。

## 第一次创作

1. 在 Claude Code 里让它初始化一本书，填题材、主角、世界观
2. 让它规划卷纲，确认主线与节奏
3. 按章写作，每章结束后跑审查
4. 关键设定会被沉淀进记忆，后续写作自动带上
5. 需要回看时打开只读面板查状态

## 版本怎么选

| 分支 | 形态 | 说明 |
|---|---|---|
| `master` | v6 · Claude Code 插件 | 维护中，只修致命 bug |
| `v8` | DeepSeek Harness 写作工作台 | 正式版，安装方式不同 |

## 注意

- 必须先装好 Claude Code 并登录
- Python 依赖装在当前环境，建议单独建虚拟环境
- v6 与 v8 不能直接互换，旧书仓没有验证过的迁移方案
- AI 写的内容要自己核事实、查版权，别直接发布
- 长篇创作会持续消耗模型额度

## 常见坑

- claude 命令不存在：先安装并登录 Claude Code
- 插件找不到：确认 marketplace 名字与仓库名一致
- pip 装依赖失败：换国内镜像，或建虚拟环境后再装
- 面板打不开：确认依赖装全，并按文档启动
- 记忆乱掉：不要手工改记忆文件，用流程里的审查步骤修
- 想升级到 v8：先读完 v8 安装指南，别直接覆盖旧目录
- 生成质量差：补足设定与卷纲，别让模型自由发挥

## 免责声明

本仓库为第三方指南，与 Webnovel Writer 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-10-31），项目迭代快，请以[官方文档](https://lingfengqaq.github.io/webnovel-writer/docs/install.html)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
