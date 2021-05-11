z390ud - gigabyte -
https://www.gigabyte.com/Motherboard/Z390-UD-rev-11/support#support-dl-bios

Power > ErP > Disabled

### check bios status
sudo ethtool eth0 | grep -i wake

`NG: Wake-on: d`
`OK: Wake-on: g`


### excute
wakeonlan xx:xx:xx:xx:xx:xx

### cpu tempreture
sudo apt install lm-sensors
sensors
