#!/bin/sh
#
# Perform basic settings on a known IP camera
#
#
# Set custom upgrade url
#
fw_setenv upgrade 'https://github.com/Jamp/firmware/releases/download/ipc017-divinus/ssc325_lite_chuangmi-ipc017-divinus-nor.tgz'
#
# Set wlan device and credentials if need
#
fw_setenv wlandev mt7601u-ssc325-chuangmi-ipc017
#fw_setenv wlanssid Router
#fw_setenv wlanpass 12345678

exit 0
