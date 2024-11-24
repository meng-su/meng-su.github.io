#!/usr/bin/env bash

# 确保脚本抛出遇到的错误
set -e


#push_addr=`git remote get-url --push origin` # git提交地址，也可以手动设置，比如：push_addr=git@github.com:xugaoyi/vuepress-theme-vdoing.git
push_addr=git@github.com:meng-su/meng-su.github.io.git
#commit_info=`git describe --all --always --long`
commit_info='all'
dist_path=./ # 打包生成的文件夹路径
push_branch=documents # 推送的分支

# 生成静态文件
npm run build

# 进入生成的文件夹
cd $dist_path
cat  > LICENSE << EOF 
MIT License

Copyright (c) 2024-present Gutzaria

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

git init
git add -A
git commit -m "deploy, $commit_info"

git push -f $push_addr HEAD:$push_branch #master:$push_branch #HEAD:$push_branch

cd -
# rm -rf $dist_path
