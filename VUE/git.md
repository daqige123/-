### 基本概念

- **工作区：**就是你在电脑里能看到的目录。
- **暂存区：**英文叫 stage 或 index。一般存放在 **.git** 目录下的 index 文件（.git/index）中，所以我们把暂存区有时也叫作索引（index）。
- **版本库：**工作区有一个隐藏目录 **.git**，这个不算工作区，而是 Git 的本地仓库（版本库）。



![img](https://www.runoob.com/wp-content/uploads/2015/02/1352126739_7909.jpg)



![img](https://www.runoob.com/wp-content/uploads/2015/02/git-command.jpg)

- workspace：工作区
- staging area：暂存区
- local repository：本地仓库
- remote repository：远程仓库

#### 成功push

git init  初始化仓库

git add .  将新的文件 添加到暂存区

git commit  -m "message"    提交到本地仓库    

git remote add  supermall(别名)  https://github.daqige123/supermall.git  (url)     添加远程仓库

git push [远程仓库名]  [分支名]  提交到远程仓库 

git push https://github.com/daqige123/supermall master



### git 官方建议

```
echo "# algorithm" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/daqige123/algorithm.git
git push -u origin main
```



#### git 的一些命令

git init 初始化仓库 

git pull    从远程服务器获取到一个branch分支的更新到本地，并更新本地库，叫做pull.

git remote  -v 查看当前配置有哪些远程库 以及实际链接地址

git status  查看状态

#### 提取远程仓库

git fecth supermall 从远程仓库下载新分支和数据

该命令执行完之后需要执行 git merge 远程分支到你的分支

git merge  supermall/master  从远程仓库提取数据并尝试合并到你所在的分支。

cat README.md 查看readme

#### 删除远程仓库

git remote rm [别名]





拷贝的话，直接就有关联了。



