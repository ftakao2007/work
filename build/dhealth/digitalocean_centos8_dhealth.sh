#!/bin/sh

user=centos
yourdlt_version="1.2.1"
symbol_cli_version="1.0.0"

#key=
#address=
. ./setup_params_dhealth

# test
#ssh -i ~/.ssh/${key} ${user}@${address}
#exit

# 基本的なソフトウェアのインストール
#./digitalocean_centos8_dhealth_base.sh $key $address $yourdlt_version $symbol_cli_version

# yourdltの設定と起動
./digitalocean_centos8_dhealth_yourdlt.sh $key $address

# symbol-cliの設定
#./digitalocean_centos8_symbolnode_cli.sh

# ハーベストの設定
#./digitalocean_centos8_symbolnode_harvest.sh
