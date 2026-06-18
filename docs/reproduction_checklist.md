# Resume Meow Reproduction Checklist

本清单用于验证「简历喵」模板是否能在 OpenClaw / 龙虾雇佣平台云电脑环境中复现成功。

## 1. 仓库获取

* [ ] 已成功 clone 仓库
* [ ] 仓库目录存在
* [ ] README.md 可正常查看
* [ ] scripts/00_check_env.sh 存在
* [ ] scripts/01_install_workspace_files.sh 存在

## 2. 环境检查

执行：

```bash
bash scripts/00_check_env.sh
```

检查结果：

* [ ] openclaw 命令存在
* [ ] ~/.openclaw/workspace 存在
* [ ] ~/.openclaw/workspace/skills 存在
* [ ] 模板文件完整
* [ ] 未发现明显敏感运行态文件

通过标志：

```text
PASS: template files are complete
PASS: no obvious sensitive runtime files found
```

## 3. 本地模板安装

执行：

```bash
bash scripts/01_install_workspace_files.sh
```

检查结果：

* [ ] 已备份原有 IDENTITY.md
* [ ] 已备份原有 resume-meow skill
* [ ] 新 IDENTITY.md 已复制到 ~/.openclaw/workspace/IDENTITY.md
* [ ] resume-meow skill 已复制到 ~/.openclaw/workspace/skills/resume-meow

## 4. OpenClaw Chat 身份固定

在 OpenClaw Chat 中发送：

```text
请读取当前 workspace 根目录下的 IDENTITY.md，并将你的身份固定为「简历喵」。后续请优先使用 resume-meow skill 的规则工作。
```

检查结果：

* [ ] Chat 确认身份为「简历喵」
* [ ] Chat 确认主要能力包括简历诊断、项目经历优化、岗位 JD 匹配、HR/BOSS 话术
* [ ] Chat 不再使用默认 BOOTSTRAP 身份
* [ ] 如有 SOUL.md，身份已写入或更新

## 5. 本地能力测试

测试任务应至少包含：

* [ ] 用户背景
* [ ] 目标岗位
* [ ] 原始项目经历
* [ ] 岗位 JD

输出应包含：

* [ ] 简历诊断
* [ ] 原始表达问题
* [ ] 优化后的项目经历
* [ ] 岗位匹配分析
* [ ] HR / BOSS 打招呼话术
* [ ] 风险提醒
* [ ] Markdown 文本输出

边界检查：

* [ ] 不虚构学历
* [ ] 不虚构公司
* [ ] 不虚构实习
* [ ] 不虚构项目上线
* [ ] 不把“参与”写成“主导”
* [ ] 不把“了解”写成“精通”
* [ ] 不把“用过”写成“熟练使用”

## 6. 平台上架前检查

如需上架雇佣平台，需额外确认：

* [ ] INSTACLAW_WS_URL 指向 wss://claw.int-os.com/ws/chat
* [ ] TASK_API_BASE_URL 指向 https://claw.int-os.com
* [ ] insta-claw-connector 已安装
* [ ] 不复用其他龙虾的 profile、claw_id、app_key、app_secret
* [ ] profile 注册信息已人工确认
* [ ] app_key / app_secret 已写入 channels.insta-claw-connector
* [ ] gateway 已重启
* [ ] InstaClaw WSS 连接正常

## 7. 平台接单与交付检查

如配置雇佣平台接单，需要确认：

* [ ] insta-orcha-task 已安装
* [ ] grab_yintai_tasks cron 已创建或更新
* [ ] cron 状态为 ok
* [ ] cron 已 enable
* [ ] 能在雇佣平台搜索到「简历喵-求职助手」
* [ ] 能点击雇佣
* [ ] 能发送最小真实任务
* [ ] 能接单
* [ ] 能生成真实 Markdown 结果文件
* [ ] 能 package_and_upload 上传
* [ ] 平台可下载或查看交付结果
* [ ] 交付内容可正常打开

## 8. 验收结论

* [ ] 本地复现通过
* [ ] 平台上架通过
* [ ] 接单交付通过
* [ ] README 流程可读
* [ ] 无敏感信息泄露
* [ ] 可作为 OpenClaw 云电脑冷启动模板继续扩展
