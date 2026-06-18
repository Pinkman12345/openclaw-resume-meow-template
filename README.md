# OpenClaw Resume Meow Template

## 项目定位

这是一个面向 OpenClaw / 龙虾雇佣平台云电脑环境的「简历喵」可复现模板工程。

该项目不是脱离 OpenClaw 独立运行的 Python Agent，而是用于在平台分配的云电脑内部快速复现一只简历优化类功能龙虾。

## 当前能力

- 简历诊断
- 项目经历优化
- 岗位 JD 匹配分析
- HR / BOSS 打招呼话术
- 求职邮件
- 自我介绍
- 面试回答优化
- Markdown 文本交付

## 目录结构

```
openclaw-resume-meow-template/
├── openclaw_workspace/
│   ├── IDENTITY.md                   # 龙虾身份定义（名称、能力、边界规则）
│   └── skills/resume-meow/           # 简历喵 skill 能力包
│       ├── _meta.json                # skill 元信息
│       ├── SKILL.md                  # 工作规则和流程定义
│       ├── skill-card.md             # 对外展示介绍
│       └── ACCEPTANCE.md             # 本地验收记录
├── platform/
│   ├── profile.example.json          # 平台上架用的 profile 示例（不含凭证）
│   └── cron_message.md               # 接单 cron 消息模板（不含凭证）
├── docs/
│   └── current_state.md              # 当前状态记录
├── .gitignore
└── README.md
```

### 目录说明

| 目录 | 作用 |
|---|---|
| `openclaw_workspace/` | 可直接复制到 `~/.openclaw/workspace/` 的身份和技能包 |
| `platform/` | 平台上架所需的 profile 公开展示信息和 cron 消息参考 |
| `docs/` | 项目状态文档，便于复现时了解当前进度 |

## 快速复现流程（云电脑路线）

```bash
# 1. 克隆仓库
git clone <repo-url> openclaw-resume-meow

# 2. 进入目录
cd openclaw-resume-meow

# 3. 复制身份文件
cp openclaw_workspace/IDENTITY.md ~/.openclaw/workspace/IDENTITY.md

# 4. 复制 skill 包
cp -r openclaw_workspace/skills/resume-meow ~/.openclaw/workspace/skills/

# 5. 在 OpenClaw Chat 中读取 IDENTITY.md 并固定身份
#    在 Chat 中发送：
#    请读取当前 workspace 根目录下的 IDENTITY.md，并将你的身份固定为「简历喵」

# 6. 做本地能力测试（提供一份简历或项目经历进行测试）

# 7. 如需上架，按平台流程继续：
#    安装 insta-claw-connector → 注册 profile → 配置 credentials
#    → 重启 gateway → 安装 insta-orcha-task → 创建 grab_yintai_tasks cron
#    → 平台实测
```

## 安全说明

- 仓库不包含 app_key、app_secret、clientId、clientSecret、claw_id、API Key
- 不要提交 openclaw.json
- 不要提交 profile 返回文件（如 `*_profile_response.json`）
- 不要提交 .env
- 已配置 `.gitignore` 覆盖上述所有敏感文件模式

## 后续扩展

- [ ] 增加 install 脚本（一键复现）
- [ ] 增加复现检查脚本（验证文件完整性）
- [ ] 增加更多功能型龙虾模板
- [ ] 增加平台上架 checklist

## 使用安装脚本复现到 OpenClaw workspace

在平台分配的云电脑中，克隆本仓库后，可使用安装脚本将「简历喵」模板文件布置到当前 OpenClaw workspace。

```bash
cd ~/openclaw-resume-meow-template
bash scripts/01_install_workspace_files.sh
```

命令说明：

* `cd ~/openclaw-resume-meow-template`：进入本仓库目录；
* `bash scripts/01_install_workspace_files.sh`：执行安装脚本，将模板中的 `IDENTITY.md` 和 `resume-meow` skill 复制到 `~/.openclaw/workspace`。

脚本会执行以下操作：

1. 检查模板文件是否存在；
2. 检查目标 OpenClaw workspace；
3. 如已有 `IDENTITY.md`，先自动备份；
4. 如已有 `skills/resume-meow`，先自动备份；
5. 复制新的 `IDENTITY.md`；
6. 复制 `resume-meow` skill；
7. 输出下一步提示。

安装完成后，请打开 OpenClaw Chat，并发送：

```text
请读取当前 workspace 根目录下的 IDENTITY.md，并将你的身份固定为「简历喵」。后续请优先使用 resume-meow skill 的规则工作。
```

随后进行本地能力测试，确认它能完成：

* 简历诊断；
* 项目经历优化；
* 岗位 JD 匹配分析；
* HR / BOSS 打招呼话术；
* 风险提醒；
* Markdown 文本输出。

注意：该脚本只负责布置本地身份和 skill，不会注册雇佣平台 profile，不会配置 app_key / app_secret，不会创建 cron。

