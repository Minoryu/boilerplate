#!/bin/sh
# reference: https://qiita.com/kentarok/items/6e818c2e6cf66c55f19a


HOSTNAME=hostname1
STATIC_IP=192.168.1.1/24
ROUTER_IP=192.168.1.1

declare -a MACHINES=()

MACHINES[0]="192.168.1.1  hostname1"
MACHINES[1]="192.168.1.2  hostname2"
MACHINES[2]="192.168.1.3  hostname3"

###############################

apt-get update \
  && sudo apt-get -y dist-upgrade \
  && sudo apt-get -y autoremove \
  && sudo apt-get autoclean

sudo apt-get -y install git git-core

cat <<-EOD >> /root/.vimrc
set nocompatible
set backspace=indent,eol,start
EOD

cat <<-EOD >> /home/pi/.vimrc
set nocompatible
set backspace=indent,eol,start
EOD


cat <<-EOD >> /etc/dhcpcd.conf

#add $(date "+%Y%m%d")
interface wlan0
static ip_address=$STATIC_IP
static routers=$ROUTER_IP
static domain_name_servers=$ROUTER_IP 8.8.8.8

EOD

hostnamectl set-hostname $HOSTNAME

cat <<-EOD >> /etc/hosts

127.0.1.1       $HOSTNAME

EOD

for m in "${MACHINES[@]}"
do
    cat <<-EOD >> /etc/hosts

$m
EOD   
done



# iptable
update-alternatives --set iptables /usr/sbin/iptables-legacy

# requirements for kubernetes
dphys-swapfile swapoff
systemctl stop dphys-swapfile
systemctl disable dphys-swapfile

# docker install
curl -sSL https://get.docker.com | sh


apt-get update && apt-get install -y apt-transport-https curl

# kubernetes install
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF | tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubelet kubeadm kubectl


apt-mark hold docker-ce kubelet kubeadm kubectl

###############################


# ssh
ssh-copy-id -i /Users/kentarok/.ssh/sl_rsa.pub pi@192.168.13.101
cat <<-EOD >> /etc/ssh/sshd_config
PasswordAuthentication no
EOD



