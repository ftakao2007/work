#!/bin/sh

user=ubuntu
### Conoha Sample
### https://support.conoha.jp/vps/school/minecraft/?btn_id=v-hellovps-m-01-sidebar_vps-school-minecraft
#openjdk_version="8"
#forge_url="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.13.2-25.0.209/forge-1.13.2-25.0.209-installer.jar"
#forge_version="1.13.2-25.0.209"

### JojoBAdv
### https://www.youtube.com/watch?v=urlqNVFcXD4
### https://www.curseforge.com/minecraft/mc-mods/steves-bizarre-adventure/files
openjdk_version="8"
forge_url="https://maven.minecraftforge.net/net/minecraftforge/forge/1.12.2-14.23.5.2855/forge-1.12.2-14.23.5.2855-installer.jar"
forge_version="1.12.2-14.23.5.2855"

### memory
ms_memory_mb="1024"
mx_memory_mb="1024"

#key=
#address=
. ./setup_params_minecraft

# test
#ssh -i ~/.ssh/${key} ${user}@${address}
#exit


# 基本的なソフトウェアのインストール
./digitalocean_ubuntu_minecraft_base.sh $key $address $openjdk_version

# minecraftのインストール
./digitalocean_ubuntu_minecraft_install.sh $key $address $forge_version $ms_memory_mb $mx_memory_mb $forge_url
