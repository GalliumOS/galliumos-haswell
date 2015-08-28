#!/bin/bash
# File: "/lib/systemd/system-sleep/cyapa.sh".

case $1/$2 in
    pre/*)
	;;
    post/*)
	COUNTER=0
	while [  $COUNTER -lt 10 ]; do
            date >>/tmp/99_cyapa
            dmesg | grep cyapa | tail -1 | grep "\(error\|fail\)" >/dev/null
            RES=$?
            if [ ${RES} -ne 1 ] ; then
  		/sbin/rmmod cyapatp
                /sbin/modprobe cyapatp
 		sleep 1
            else
 		#done
 		COUNTER=11
	    fi
	    
            COUNTER=`expr $COUNTER + 1`
	done
	;;
esac
exit 0
