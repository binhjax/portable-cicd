#!/bin/bash
tar -xvzf ../packages/docker-20.10.7.tgz  
sudo cp ../packages/docker/* /usr/bin/
cp daemon.json /etc/docker/

cp ../packages/docker-compose /usr/bin/
chmod +x /usr/bin/docker-compose

# wget https://github.com/docker/compose/releases/download/1.29.2/docker-compose-Linux-x86_64
# mv docker-compose-Linux-x86_64 docker-compose
# sudo mv docker-compose /usr/local/bin/
# sudo chmod +x /usr/local/bin/docker-compose
# curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-`uname -s`-`uname -m` -o docker-compose 
# && chmod +x docker-compose

https://github.com/docker/compose/releases/download/1.29.2/docker-compose-Linux-x86_64