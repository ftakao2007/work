#!/bin/sh

user=ubuntu
symbol_bootstrap_version="1.1.10"
symbol_cli_version="1.0.0"

#key=
#address=
. ./setup_params_symbolnode

# test
#ssh -i ~/.ssh/${key} ${user}@${address}
#exit


# 基本的なソフトウェアのインストール
./digitalocean_ubuntu_symbolnode_base.sh $key $address $symbol_bootstrap_version $symbol_cli_version $user

# symbol_bootstrapの設定と起動
#./digitalocean_ubuntu_symbolnode_bootstrap.sh $key $address

# symbol-cliの設定
#./digitalocean_centos8_symbolnode_cli.sh

# ハーベストの設定
#./digitalocean_centos8_symbolnode_harvest.sh
