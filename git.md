# git cheatsheet

## Start

```shell
% 克隆一个远程仓库、创建本地属于你自己的分支、切换到你自己的分支
git clone https://github.com/ShenZehong/qaq-name.git
git branch your-branch-name
git checkout your-branch-name

% 查看本地的所有分支，查看远程的所有分支
git branch
git branch -r

% 贡献你的创作
git add -A
git commit -a -m "This is What I Created!"
```



## 用本地your-branch-name新建/上传到指定的远程分支

```shell
& 将本地的your-branch-name作为远程(origin)的master
git push origin your-branch-name:master
& 将本地的your-branch-name作为远程的test
git push origin your-branch-name:test
```



## 拉取并合并分支

```shell
% 从远程的origin找'master'分支，如果没有返回128，下载到本地同名分支，没有即创建
git fetch origin master
% 如果你想用它创建一个新名字的分支
git fetch origin master:new-name

% 将从origin的master已下载的分支代码合并到本地仓库的当前分支。
git merge origin/master
```

注意！`fetch`不包含`merge`。使用`pull`可以简化这个过程，但是如同单反和傻瓜相机的区别！



## 文件回退版本

```shell
%版本回退
git log Keypoint.py
git checkout ee25a1a3f9465 Keypoint.py
git commit -a -m "bugfix/ mis delete"

%单纯撤销commit不修改代码
git reset HEAD~
```



## 删除远程分支

```shell
git branch -r -d origin/branch-name
git push origin :branch-name
```

## Stash藏匿

```shell
& 附上说明信息
git stash save "stash my workspace"
git stash list

& 不删除栈中存储信息
git stash pop

& 将缓存堆栈中的stash多次应用到工作目录，但不删除拷贝，因此还要drop
git stash apply
git stash drop
```
