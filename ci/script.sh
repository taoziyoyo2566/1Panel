#!/bin/bash

command -v wget >/dev/null || { 
  echo "wget not found, please install it and try again ."
  exit 1
}

if [ ! -f "1pctl" ]; then 
  wget https://github.com/1Panel-dev/installer/raw/v2/1pctl
fi

if [ ! -f "install.sh" ]; then 
  wget https://github.com/1Panel-dev/installer/raw/v2/install.sh
fi

if [ ! -f "1panel-core.service" ]; then 
  wget https://github.com/1Panel-dev/installer/raw/v2/1panel-core.service
fi

if [ ! -f "1panel-agent.service" ]; then 
  wget https://github.com/1Panel-dev/installer/raw/v2/1panel-agent.service
fi

if [ ! -d "lang" ]; then 
  mkdir -p lang && cd lang
  for lang in en fa pt-BR ru zh; do
    wget -q https://github.com/1Panel-dev/installer/raw/v2/lang/$lang.sh
  done
  cd ..
fi

if [ ! -f "GeoIP.mmdb" ]; then 
  wget https://resource.fit2cloud.com/1panel/package/v2/geo/GeoIP.mmdb
fi

chmod 755 1pctl install.sh
