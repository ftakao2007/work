#!/bin/sh

user=ftakao2007
symbol_bootstrap_version="1.0.4"
symbol_cli_version="1.0.0"

#key=
#address=
. ./setup_params_symbolnode_testnet

# test
#ssh -i ~/.ssh/${key} ${user}@${address}
#exit


# 基本的なソフトウェアのインストール
#./t4vps_testnet_centos8_symbolnode_base.sh $key $address $symbol_bootstrap_version $symbol_cli_version

# symbol_bootstrapの設定と起動
#./t4vps_testnet_centos8_symbolnode_bootstrap.sh $key $address

# symbol-cliの設定
./t4vps_testnet_centos8_symbolnode_cli.sh

# ハーベストの設定
#./t4vps_testnet_centos8_symbolnode_harvest.sh
