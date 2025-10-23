#!/bin/bash

# 部署到 GitHub Pages 的脚本
# 使用方法: ./deploy.sh [message]

set -e

# 默认提交信息
COMMIT_MESSAGE=${1:-"Auto deploy to GitHub Pages"}

echo "🚀 开始部署到 GitHub Pages..."

# 检查是否在正确的目录
if [ ! -f "package.json" ]; then
    echo "❌ 错误: 请在项目根目录运行此脚本"
    exit 1
fi

# 检查是否安装了 gh-pages
if ! command -v gh-pages &> /dev/null; then
    echo "📦 安装 gh-pages 工具..."
    npm install -g gh-pages
fi

# 安装依赖
echo "📦 安装项目依赖..."
npm ci

# 构建项目
echo "🔨 构建项目..."
npm run build

# 使用 gh-pages 部署
echo "📤 部署到 GitHub Pages..."
gh-pages --dist dist --remote origin --branch gh-pages --message "$COMMIT_MESSAGE"

echo "✅ 部署完成!"
echo "🌐 你的网站将在几分钟后部署到: https://mmsmm.github.io/vue-hello-world/"