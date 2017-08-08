#!/bin/sh
container="base_centos7"

rebuild_flg=1

if [ "${rebuild_flg}" == "1" ]; then
  docker ps | grep ${container} > /dev/null
  if [ "$?" == "0" ]; then
    docker stop ${container}
    docker rm ${container}
  fi

  docker-compose -f docker-compose_base_centos7.yml up -d
fi

### 設定ファイルの読み込み
. ./setup_shirasagi

### "shirasagi"タグは"furigana"+"voice"+"shirasagi_only"+"init"
### 開発用
#tags="dev"
### init初期化非実施
#tags="mongodb,rvm,nginx,furigana,voice,shirasagi_only"
### 全ての設定を実施
tags="mongodb,rvm,nginx,shirasagi"


### SIRASAGIインストール実行
ansible-playbook -i "${inventory}" -c paramiko shirasagi_centos7.yml -u ${user} -t ${tags} \
                 --extra-vars "shirasagi_rvm_ruby_version=${rvm_ruby_version} \
                               shirasagi_rvm_home=${rvm_home} \
                               shirasagi_app_user=${app_user} \
                               shirasagi_app_group=${app_group} \
                               shirasagi_install_path=${install_path} \
                               shirasagi_web_address=${web_address} \
                               shirasagi_comp_port=${comp_port} \
                               shirasagi_child_port=${child_port} \
                               shirasagi_opend_port=${opend_port} \
                              "
