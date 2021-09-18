#!/bin/sh

#user=centos
#key=
#address=
#. ./setup_params_symbolnode

# test
#ssh -i ~/.ssh/${key} ${user}@${address}
#exit


### 鍵情報の確認
#symbol_network=
#bootstrap_pass=
#wallet_pass=
. ./setup_params_symbolnode_harvest

cd ~/symbol_${symbol_network}
symbol-bootstrap decrypt --source target/addresses.yml --destination add.yml --password=${bootstrap_pass}

transport_pub=`grep -A 3 transport: add.yml | grep publicKey: | awk '{print $2}'`
remote_pub=`grep -A 3 remote: add.yml | grep publicKey: | awk '{print $2}'`
vrf_pub=`grep -A 3 vrf: add.yml | grep publicKey: | awk '{print $2}'`
remote_priv=`grep -A 3 remote: add.yml | grep privateKey: | awk '{print $2}'`
vrf_priv=`grep -A 3 vrf: add.yml | grep privateKey: | awk '{print $2}'`

echo "transport_pub"
grep -B 2 $transport_pub add.yml
echo "remote_pub"
grep -B 2 $remote_pub add.yml
echo "vrf_pub"
grep -B 2 $vrf_pub add.yml
echo "remote_priv"
grep -B 1 $remote_priv add.yml
echo "vrf_priv"
grep -B 1 $vrf_priv add.yml

if [ -f "add.yml" ]; then rm add.yml; fi

### ハーベスト設定

### accountkeylink
if grep -A 3 remote: target/addresses.yml | grep publicKey: | awk '{print $2}' | grep -w ${remote_pub}; then
  symbol-cli transaction accountkeylink --password ${wallet_pass} --linked-public-key ${remote_pub} --action Link --max-fee 1000000 --mode normal --sync --announce
else
  echo "remote publick key error"
  exit 1
fi

### vrfkeylink
if grep -A 3 vrf: target/addresses.yml | grep publicKey: | awk '{print $2}' | grep -w ${vrf_pub}; then
  symbol-cli transaction vrfkeylink --password ${wallet_pass} --linked-public-key ${vrf_pub} --action Link --max-fee 1000000 --mode normal --sync --announce
else
  echo "vrf publick key error"
  exit 2
fi

### nodekeylink
if grep -A 3 transport: target/addresses.yml | grep publicKey: | awk '{print $2}' | grep -w ${transport_pub}; then
  symbol-cli transaction nodekeylink --password ${wallet_pass} --linked-public-key ${transport_pub} --action Link --max-fee 1000000 --mode normal --sync --announce
else
  echo "transport publick key error"
  exit 3
fi

### persistentharvestdelegation

if [ -z "${symbol_network}" ]; then
  echo "network?(mainnet/testnet)"
  read symbol_network
fi

if [ ${symbol_network} == "testnet" ]; then
  if grep harvesterSigningPrivateKey target/nodes/node/server-config/resources/config-harvesting.properties | awk '{print $3}' | grep -w ${remote_priv}; then
    if grep harvesterVrfPrivateKey target/nodes/node/server-config/resources/config-harvesting.properties | awk '{print $3}' | grep -w ${vrf_priv}; then
      symbol-cli transaction persistentharvestdelegation --password ${wallet_pass} --remote-private-key ${remote_priv} --recipient-public-key ${transport_pub} --vrf-private-key ${vrf_priv} --max-fee 1000000 --mode normal --sync --announce
    else
      echo "vrf private key error"
      exit 4
    fi;
  else
    echo "remote private key error"
    exit 5
  fi
else
  echo "TEST_NET only"
  exit 10
fi

cd -
