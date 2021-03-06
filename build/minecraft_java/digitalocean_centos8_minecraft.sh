#!/bin/sh

user=centos
openjdk_version="1.8.0"
forge_version="1.13.2-25.0.209"
ms_memory_mb="1024"
mx_memory_mb="1024"

#key=
#address=
. ./setup_params_minecraft

# test
#ssh -i ~/.ssh/${key} ${user}@${address}
#exit


# 基本的なソフトウェアのインストール
./digitalocean_centos8_minecraft_base.sh $key $address $openjdk_version

# minecraftのインストール
./digitalocean_centos8_minecraft_install.sh $key $address $forge_version $ms_memory_mb $mx_memory_mb
