#!/bin/sh

user=centos
#key=
#address=
. ./setup_params_symbolnode

# test
#ssh -i ~/.ssh/${key} ${user}@${address}
#exit


# 基本的なソフトウェアのインストール
./digitalocean_centos8_symbolnode_base.sh

# symbol_bootstrapの設定と起動
#./digitalocean_centos8_symbolnode_bootstrap.sh

# symbol-cliの設定
#./digitalocean_centos8_symbolnode_cli.sh

# ハーベストの設定
#./digitalocean_centos8_symbolnode_harvest.sh
