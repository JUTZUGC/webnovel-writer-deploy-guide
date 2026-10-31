#!/usr/bin/env bash
set -euo pipefail
# Webnovel Writer 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://lingfengqaq.github.io/webnovel-writer/docs/install.html
# 更新日期：2026-10-31
# 类型：script
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v git >/dev/null 2>&1 || { echo "需要先安装 Git"; exit 1; }
command -v python3 >/dev/null 2>&1 || command -v python >/dev/null 2>&1 || { echo "需要先安装 Python 3"; exit 1; }

mkdir -p .download
cd .download

claude plugin marketplace add lingfengQAQ/webnovel-writer --scope user
claude plugin install webnovel-writer@webnovel-writer-marketplace --scope user
python -m pip install -r https://raw.githubusercontent.com/lingfengQAQ/webnovel-writer/HEAD/requirements.txt
echo "安装完成：在 Claude Code 里按提示初始化一本书"

echo ""

echo "部署完成"
echo "若结果异常或需要改配置，请参考官方文档：https://lingfengqaq.github.io/webnovel-writer/docs/install.html"
