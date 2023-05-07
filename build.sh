#!/bin/bash

set -ex

cd "$(dirname "$0")"

# refuse root user; otherwise, some make processes fail
[ $(id -u) -eq 0 ] && exit 1

# install prerequisites as per https://openwrt.org/docs/guide-developer/toolchain/install-buildsystem
sudo apt update
sudo apt install -y build-essential clang flex bison g++ gawk gcc-multilib g++-multilib gettext git libncurses5-dev libssl-dev python3-distutils rsync unzip zlib1g-dev file wget

# install python2 because it's seemingly required
sudo apt install -y python2

# clone Entware repository
git clone --depth=1 https://github.com/Entware/Entware.git
cd Entware

# update package feeds as per https://github.com/Entware/Entware/wiki/Compile-packages-from-sources
make package/symlinks

# install custom package definition
cp -avn ../squashfuse package/utils

# activate platform configuration
cp configs/x64-3.2.config .config

# update .config to enable package
make oldconfig

# prepare build environment as per https://github.com/Entware/Entware/wiki/How-to-add-a-new-package
# do not enable parallel make because it seemingly causes an error
make tools/install
make toolchain/install

# this is necessary initially and after make clean is executed
make target/compile

make package/squashfuse/compile

# then, locate .ipk in bin directory
