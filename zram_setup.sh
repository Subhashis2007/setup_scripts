#!/bin/bash
#
# Copyright © 2024 Subhashis2007
# SPDX-License-Identifier: GPL-3.0-only
#

function setzram() {

    printf "%s\n%s\n%s\n" "[zram0]" "zram-size = 20480" "compression-algorithm = zstd" | sudo tee /etc/systemd/zram-generator.conf
    sudo systemctl daemon-reload
    sudo systemctl start /dev/zram0
    cat /proc/swaps

}

SZG="systemd-zram-generator"

if dpkg -s $SZG >/dev/null 2>&1; then
    echo "$SZG is installed, beginning zram setup"
    setzram

else
    echo -e "$SZG is not installed. n\Installing $SZG" 
    sudo apt install -y systemd-zram-generator
    setzram

fi


