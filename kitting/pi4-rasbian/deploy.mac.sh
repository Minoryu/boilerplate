#!/bin/bash

touch $3/ssh
cat <<-EOF >> $3/wpa_supplicant.conf
country=JP
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
network={
    ssid="$1"
    psk="$2"
}

EOF

cat <<EOF
sudo raspi-config after boot

1 S4. hostname
5 L1. loccale
5 L2. timezone
8  Update

EOF

diskutil eject $3
