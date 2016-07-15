#!/bin/sh

if [ ! -d "vendor" ]; then
  bundle install --path=vendor/bundle
fi

echo "ip list"
echo "================================================"
cat properties.yml | grep '^[0-9]' | awk -F':' '{print $1 $2 }'
echo "================================================"
echo ""

echo "ip? [127.0.0.1]"
read ip
if [ -z "${ip}" ]; then ip=127.0.0.1; fi

ASK_SUDO_PASSWORD=1 bundle exec rake spec:${ip}

echo ""
echo "$ip test end."
