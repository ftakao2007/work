#!/bin/sh

user=centos
minecraft_version="1.16.221.01"

#key=
#address=
. ./setup_params_minecraft

# test
#ssh -i ~/.ssh/${key} ${user}@${address}
#exit


# minecraftのインストール
./digitalocean_centos8_minecraft_install.sh $key $address $minecraft_version
