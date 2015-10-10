#!/bin/bash
# File: "/lib/systemd/system-sleep/wifi.sh".

case $1/$2 in
    pre/*)
	/sbin/rmmod ath9k
	;;
    post/*)
	/sbin/modprobe ath9k
	systemctl restart NetworkManager
	;;
esac
exit 0
