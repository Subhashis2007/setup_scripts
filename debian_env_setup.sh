#!/bin/bash
#
# Copyright © 2024 Subhashis2007
# SPDX-License-Identifier: GPL-3.0-only
#

# Simple and robust script to setup debian environment for aosp compiling.

## dependencies for android build environment
pkgs="
bc
bison
build-essential
ccache
curl
flex
g++-multilib
gcc-multilib
git
gnupg
gperf
imagemagick
lib32ncurses5-dev
lib32readline-dev
lib32z1-dev
liblz4-tool
libncurses5
libncurses5-dev
libsdl1.2-dev
libssl-dev
libwxgtk-webview3.2-dev
libwxgtk-webview3.2-1
libxml2
libxml2-utils
lzop
pngcrush
rsync
schedtool
squashfs-tools
xsltproc
zip
zlib1g-dev
tmate
ssh
patchelf
binutils
python-is-python3
systemd-zram-generator
git-lfs
zsh
vim"

# Install dependencies
for packages in $pkgs; do
sudo apt install -y $packages | tee installation.log
done

# Setup git profile
git config --global user.name "Subhashis2007"
git config --global user.email "itzsubhashis@proton.me"
git config --global core.editor "vim"
git config --global color.ui false ## disable prompt for color selection

# Install repo
mkdir -p ~/.bin
PATH="${HOME}/.bin:${PATH}"
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/.bin/repo
chmod a+rx ~/.bin/repo

sleep 5

# zram
echo "beginning zram setup"
bash zram_setup.sh
