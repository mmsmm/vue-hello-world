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

# 安装依赖
echo "📦 安装依赖..."
npm ci

# 构建项目
echo "🔨 构建项目..."
npm run build

# 进入 dist 目录
cd dist

# 初始化 git 仓库
echo "📚 初始化 git 仓库..."
git init
git branch -M main

# 添加所有文件
git add .

# 提交更改
echo "💾 提交更改..."
git commit -m "$COMMIT_MESSAGE"

# 推送到 gh-pages 分支
echo "📤 推送到 GitHub Pages..."
git push -f https://github.com/mmsmm/vue-hello-world.git main:gh-pages

# 返回上一级目录
cd ..

echo "✅ 部署完成!"
echo "🌐 你的网站将在几分钟后部署到: https://mmsmm.github.io/vue-hello-world/"