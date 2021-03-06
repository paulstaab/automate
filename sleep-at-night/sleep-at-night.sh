#!/bin/sh -

# Only suspend the system in the evening
HOUR=$(date +"%H")
if [ ${HOUR} -le 17 -a ${HOUR} -ge 7 ]; then
	echo "Not suspending system because it is too early"
	exit 0
fi

# Only suspend when the system is idle
# This is determined based on the average load during the last 15 min
load=$(cat /proc/loadavg | cut -d " " -f 3)
if [ ${load} \> 0.3 ]; then
	echo "Not suspending system because it is still busy ($load)"
	exit 0
fi

if [ ${HOUR} -le 7 ]; then
	WAKE_UP_TIME=$(date +%s -d '8:00')
else
	WAKE_UP_TIME=$(date +%s -d 'tomorrow 8:00')
fi

# Suspend and wake up on 8:00 am next morning
rtcwake -m mem -t ${WAKE_UP_TIME}

