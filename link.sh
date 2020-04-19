#!/bin/bash

LocalInstall=/aker/bin/firewall/codata

Links=$LocalInstall/url_download.txt
LogWget=wget-log*
ETH_WAN=eth0
cd $LocalInstall

for i in `cat $Links`;do

	wget -b $i -O /dev/nulll

done


iftop -i $ETH_WAN -n -m100M
echo "Matando os downloads"
killall wget
echo "Removendo os logs"
rm -rf $LogWget








































