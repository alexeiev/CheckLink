#!/bin/bash

 #
 # Criação de software para teste de download
 # 
 # Copyright 2020 Alexeiev Farias de Araujo <ceievfa@gmail.com>
 # 
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
 # the Free Software Foundation; either version 2 of the License, or
 # (at your option) any later version.
 # 
 # This program is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 # GNU General Public License for more details.
 # 
 # You should have received a copy of the GNU General Public License
 # along with this program; if not, write to the Free Software
 # Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 # MA 02110-1301, USA.
 # 

#Declaracao de Variaveis
LocalInstall=/opt/CheckLink
VelocidadeLink=100M
ETH_WAN=enp0s3

#Variaveis estaticas
Links=$LocalInstall/url_download.txt
LogWget=wget-log*

cd $LocalInstall
function CheckSoftware(){
	So=$(which apt)
	if [ -n $So ];then
		So="apt"
	else
		So="yum"
	fi
	#software necessario
	#iftop
	Iftop=$(which iftop)
	#wget
	Wget=$(which wget)
	Erro=0
	if [ -z $Iftop ] && [ -z $Wget ];then
		echo "O pacote IFTOP e WGET sao necessarios mas nao foram  encontrados, usar o comando $So install iftop wget"
		Erro=1
	elif [ -z $Wget ];then
		echo "O pacote wget é necessario mas nao foi encontrado, usar o comando $So install wget"
		Erro=1
	elif [ -z $Iftop ];then
		echo "O pacote iftop é necessario mas nao foi encontrado, usar o comando $So install iftop"
		Erro=1
	fi

	if [ -x link.sh ];then
		:
	else
		chmod +x link.sh
	fi
	
	[ $Erro -eq 1 ] && exit 1
	
	}

CheckSoftware


for i in `cat $Links`;do

	wget -b $i -O /dev/nulll > /dev/null 2>&1

done


iftop -i $ETH_WAN -n -m$VelocidadeLink
echo "Matando os downloads"
killall wget
echo "Removendo os logs"
rm -rf $LogWget
