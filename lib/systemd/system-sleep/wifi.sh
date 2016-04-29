#!/bin/bash
# File: "/lib/systemd/system-sleep/wifi.sh".

case $1/$2 in
    post/*)
        for i in `seq 1 5`
        do
            rmmod ath9k ath9k_common ath9k_hw ath mac80211 cfg80211
	    modprobe ath9k
            sleep 1
            systemctl restart wpa_supplicant
            systemctl restart NetworkManager
            sleep 2
            WIFI=`nmcli d | grep wifi`
            if [ -n "$WIFI" ]
            then
                break
            fi
        done
        ;;
esac
exit 0
