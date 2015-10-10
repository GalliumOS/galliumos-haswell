#!/bin/bash

case $1/$2 in
    pre/*)
        /sbin/rmmod elan_i2c > /dev/null 2>&1
        /sbin/rmmod cyapatp > /dev/null 2>&1
	;;
    post/*)
        /sbin/modprobe elan_i2c > /dev/null 2>&1
        /sbin/modprobe cyapatp > /dev/null 2>&1
        ELAN=`cat /proc/bus/input/devices | grep -i elan | grep -i trackpad`
        CYAPA=`cat /proc/bus/input/devices | grep -i cyapa | grep -i trackpad`
        if [ -z "$ELAN" ]
        then
          /sbin/rmmod elan_i2c
        fi 
        if [ -z "$CYAPA" ]
        then
          /sbin/rmmod cyapatp
        fi 
	;;
esac
exit 0
