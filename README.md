# vim
#configuration about vim

git clone https://github.com/cp542524698/vim.git
cd vim; cp .vim /root -rf; cp .vimrc /root;

#安装ctags
yum localinstall ctags-5.8-13.el7.x86_64.rpm

#在代码src目录下生成tags
ctags -R

#ag依赖
yum install -y pcre-devel
yum install xz-devel
yum localinstall   the_silver_searcher-0.33.0-1.el7.x86_64.rpm -y


# 执行安装命令
# 在vim 中执行:GoInstallBinaries

