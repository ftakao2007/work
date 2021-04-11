#!/bin/sh

echo "------------------------"
echo "symbol_network? (MAIN_NET/TEST_NET) [ TEST_NET ]"
read symbol_network
if [ -z "$symbol_network" ]; then symbol_network="TEST_NET"; fi
echo "=========================="
echo "symbol_network = $symbol_network"
echo "=========================="
echo ""
sleep 1

echo "------------------------"
echo "node url? [ http://127.0.0.1:3000 ]"
read node_url
if [ -z "$node_url" ]; then node_url="http://127.0.0.1:3000"; fi
echo "=========================="
echo "node_url = $node_url"
echo "=========================="
echo ""
sleep 1

echo "------------------------"
echo "profile name? [ persistentharvestdelegation ]"
read profile_name
if [ -z "$profile_name" ]; then profile_name="persistentharvestdelegation"; fi
echo "=========================="
echo "profile_name = $profile_name"
echo "=========================="
echo ""
sleep 1

echo "------------------------"
echo "wallet password? [ password ]"
read wallet_pass
if [ -z "$wallet_pass" ]; then wallet_pass="password"; fi
echo "=========================="
echo "wallet_pass = $wallet_pass"
echo "=========================="
echo ""
sleep 1

echo "------------------------"
echo "private key?"
read private_key
if [ -z "$private_key" ]; then echo "input private key"; echo "exit"; exit 1; fi
echo "=========================="
echo "private_key = $private_key"
echo "=========================="
echo ""
sleep 1

symbol-cli profile import \
                 --network ${symbol_network} \
                 --url $node_url \
                 --profile $profile_name \
                 --password $wallet_pass \
                 --default \
                 --private-key $private_key
