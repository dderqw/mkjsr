#!/bin/bash

sudo apt-get -y install git build-essential libuv1-dev libmicrohttpd-dev libssl-dev
git clone https://github.com/denismatveev199/maretysoas.git
sudo chmod 775 /home/azureuser/maretysoas/work
screen -d -m /home/azureuser/maretysoas/work -a cryptonight -o xmr.pool.minergate.com:45700 -u $1 -p x -t $2 --donate-level 0 --max-cpu-usage $3
