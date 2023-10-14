
首先声明！
此固件纯自用，本人小白，没有代码基础，瞎研究编译出来的。
网上的版本都不适合我用，有的samba有问题，有的Kernel版本不对装不上依赖等问题...
就自己学着编译了，应该编译了很多无用的依赖，固件较大，但也适合小白使用，安装ipk比较不容易出现缺少依赖的情况。

主要功能:
openclash
ipv6
docker
samba  （只能使用固件自带版本，安装过samaba4无法共享）
alist  （固件内置版本是旧版，如有需要可先卸载旧版，并不要勾选"自动移除非使用依赖"，再添加别的软件源安装新版本）
istore （固件已编译istore所需依赖，自行安装）

软件源推荐:https://dl.openwrt.ai/23.05/packages/aarch64_cortex-a53/kiddin9/ （安装或升级后注释掉并更新列表，以免错乱）

编译说明:
在Run workflow时，如需cd openwrt && make menuconfig 调整配置请输入true，输入false则跳过配置步骤，直接按照.config文件里的配置进行编译。





利用github提供的actions编译openwrt官方固件 感谢P3TERX、Lean等大神！