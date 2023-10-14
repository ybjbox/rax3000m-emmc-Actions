cd openwrt && make menuconfig

利用github提供的actions编译openwrt官方固件 感谢P3TERX、Lean等大神！

*注意：请在Run workflow时输入true以便编译过程中使用ssh

*关于Releases下载：

在github的releases页面选择需要下载的文件，右键复制需要下载文件的链接地址

1.新建一个浏览器页面，将链接地址粘贴到浏览器地址栏，将github.com改成hub.fastgit.org

2.或者在github.com后面加上.cnpmjs.org
首先声明！此固件纯自用，本人小白，没有代码基础，瞎研究编译出来的。
网上的版本都不适合我用，就自己学着编译了，应该编译了很多无用的依赖，固件较大，但也适合小白使用，安装ipk比较不容易出现缺少依赖的情况。

编译说明:
在Run workflow时，如需cd openwrt && make menuconfig 调整配置请输入true，输入跳过直接按照.config文件里的配置进行编译。