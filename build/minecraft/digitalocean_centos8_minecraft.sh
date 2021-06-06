#!/bin/sh

user=centos
openjdk_version="1.8.0"

#key=
#address=
. ./setup_params_minecraft

# test
#ssh -i ~/.ssh/${key} ${user}@${address}
#exit


# 基本的なソフトウェアのインストール
./digitalocean_centos8_minecraft_base.sh $key $address $openjdk_version

# mincraftのインストール
./digitalocean_centos8_minecraft_install.sh $key $address

# symbol-cliの設定
#./digitalocean_centos8_symbolnode_cli.sh

# ハーベストの設定
#./digitalocean_centos8_symbolnode_harvest.sh
