### 个人版本 ###
* 清理不必要的代码、移除不必要的功能
* 更新部分软件到最新版本
* 转到CentOS/Fedora下编译
* 修改Makefile，尽量在编译时下载，减小代码库体积
* 使用upx压缩二进制文件
* 尝试修复部分编译警告

### 特别说明 ###
* hanwckf源码：https://github.com/hanwckf/rt-n56u
* 汉化字典来自：https://github.com/gorden5566/padavan

### 固件特点 ###
- 使用[gorden5566](https://github.com/gorden5566/padavan)的汉化字典
- aria2前端更换为[AriaNg](https://github.com/mayswind/AriaNg)
- [curl](https://github.com/curl/curl)可选编译可执行程序 ```CONFIG_FIRMWARE_INCLUDE_CURL```
- 可选关闭webui里不常用的vpn页面 ```CONFIG_FIRMWARE_WEBUI_HIDE_VPN```
- 使用了[PROMETHEUS](http://pm.freize.net/index.html)提供的部分补丁
- 使用了[Linaro1985/padavan-ng](https://gitlab.com/padavan-ng/padavan-ng)的部分软件包
- 可选以下插件：
>- [gdut-drcom](https://github.com/chenhaowen01/gdut-drcom) ```CONFIG_FIRMWARE_INCLUDE_GDUT_DRCOM```
>- [dogcom](https://github.com/hanwckf/dogcom) ```CONFIG_FIRMWARE_INCLUDE_DOGCOM```
>- [minieap](https://github.com/hanwckf/minieap) ```CONFIG_FIRMWARE_INCLUDE_MINIEAP```
>- [njit-client](https://github.com/hanwckf/njit8021xclient) ```CONFIG_FIRMWARE_INCLUDE_NJIT_CLIENT```
>- [napt66](https://github.com/mzweilin/napt66) ```CONFIG_FIRMWARE_INCLUDE_NAPT66```
>- [dns-forwarder](https://github.com/aa65535/hev-dns-forwarder) ```CONFIG_FIRMWARE_INCLUDE_DNSFORWARDER```
>- [vlmcsd](https://github.com/hanwckf/vlmcsd) ```CONFIG_FIRMWARE_INCLUDE_VLMCSD```
>- [ttyd](https://github.com/tsl0922/ttyd) ```CONFIG_FIRMWARE_INCLUDE_TTYD```
>- [lrzsz](https://ohse.de/uwe/software/lrzsz.html) ```CONFIG_FIRMWARE_INCLUDE_LRZSZ```
>- [htop](https://hisham.hm/htop/releases/) ```CONFIG_FIRMWARE_INCLUDE_HTOP```
>- [iperf3](https://github.com/esnet/iperf) ```CONFIG_FIRMWARE_INCLUDE_IPERF3```
>- [dump1090](https://github.com/hanwckf/dump1090) ```CONFIG_FIRMWARE_INCLUDE_DUMP1090```
>- [rtl-sdr](https://github.com/osmocom/rtl-sdr) ```CONFIG_FIRMWARE_INCLUDE_RTL_SDR```
>- [samba3.6](https://gitlab.com/padavan-ng/padavan-ng/tree/master/trunk/user/samba36) ```CONFIG_FIRMWARE_INCLUDE_SMBD36```
>- [mtr](https://github.com/traviscross/mtr) ```CONFIG_FIRMWARE_INCLUDE_MTR```
>- [socat](http://www.dest-unreach.org/socat) ```CONFIG_FIRMWARE_INCLUDE_SOCAT```
>- [srelay](https://socks-relay.sourceforge.io) ```CONFIG_FIRMWARE_INCLUDE_SRELAY```
>- [tunsafe](https://github.com/TunSafe/TunSafe) ```CONFIG_FIRMWARE_INCLUDE_TUNSAFE```

- 已适配除官方适配外的以下机型
>- 京东云路由(文件来自Lintel) 编译代码: JDC-1
>- 歌华链(感谢群里Heaven适配与测试）编译代码: GHL
>- NEWIFI-D1
>- B70(感谢Untitled提供荒野无灯的适配文件)
>- JCG-AC856M(感谢群里的旅途中的我适配和测试,gpio值还未完全适配，但不影响使用)
>- JCG-AC836M(感谢群里的碧霄客修改和测试)
>- YK-L1(L1、L1C、L1W通刷)
>- 5K-W20 (USB)
>- OYE-001 (USB)
>- NEWIFI-MINI (USB)
>- MI-MINI (USB)
>- MI-3 (USB)
>- MI-R3G (USB)
>- HC5661A
>- HC5761A (USB)
>- HC5861B
>- 360P2 (USB)
>- MI-NANO
>- MZ-R13
>- MZ-R13P
>- RT-AC1200GU (USB)
>- XY-C1 (USB)
>- WR1200JS (USB)
>- NEWIFI3 (USB)
>- K2P
>- K2P-USB (USB)
>- JCG-836PRO (USB)
>- JCG-AC860M (USB)
>- DIR-882 (USB)
>- DIR-878
>- MR2600 (USB)

***

### 编译说明 ###

* 安装依赖包
```shell
sudo dnf update -y
sudo dnf install unzip libtool curl cmake gperf gawk flex bison cpio git \
     python3-docutils gettext automake info help2man pkg-config libmpc-devel \
     mpfr-devel ncurses-devel libtool-ltdl-devel zlib-devel perl-Pod-Html \
     gettext-devel vim-enhanced gmp-devel zlib-devel upx texinfo -y
```
* 克隆源码
```shell
git clone --depth=1 https://github.com/mia0x75/rt-n56u.git /opt/rt-n56u
```
* 准备工具链
```shell
cd /opt/rt-n56u/toolchain-mipsel

# 可以从源码编译工具链，这需要一些时间：
./clean_toolchain
./build_toolchain

# 或者下载预编译的工具链：
mkdir -p toolchain-3.4.x
wget https://github.com/hanwckf/padavan-toolchain/releases/download/v1.0/mipsel-linux-uclibc.tar.xz
tar -xvf mipsel-linux-uclibc.tar.xz -C toolchain-3.4.x
```
* (可选) 修改机型配置文件
```shell
vi /opt/rt-n56u/trunk/configs/templates/K2P.config
```
* 清理代码树并开始编译
```shell
cd /opt/rt-n56u/trunk
sudo ./clear_tree
sudo ./build_firmware_modify K2P
# 脚本第一个参数为路由型号，在trunk/configs/templates/中
# 编译好的固件在trunk/images里
```

***
### 上游代码 ###
- https://github.com/Yonsm/Padavan
- https://github.com/chongshengB/rt-n56u
- https://github.com/hanwckf/rt-n56u
- https://gitlab.com/padavan-ng/padavan-ng
