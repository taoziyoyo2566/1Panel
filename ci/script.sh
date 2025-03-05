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

if [ ! -f "GeoIP.mmdb" ]; then 
  wget https://resource.1panel.pro/geo/GeoIP.mmdb
fi

if [ ! -f "lang.tar.gz" ]; then 
  wget https://resource.1panel.pro/language/lang.tar.gz
  tar zxvf lang.tar.gz
  rm -rf lang.tar.gz
fi

chmod 755 1pctl install.sh