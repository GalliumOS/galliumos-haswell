#!/bin/bash
# File: "/etc/pm/sleep.d/99wifi".

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
