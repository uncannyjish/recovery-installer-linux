#!/usr/bin/env bash

printf "\n\n\nDetecting your device[Make sure it is in fastboot mode{VOL DN+Power}]...\n\n\n" 

"`dirname $0`/../platform-tools/fastboot" getvar product 2>&1 | grep "^product: *$1$"
if [ $? -ne 0 ] ; then echo "Device mismatch"; exit 1; fi
    
"`dirname $0`/../platform-tools/fastboot" --disable-verity --disable-verification flash vbmeta "`dirname $0`/../images/vbmeta.img"
if [ $? -ne 0 ] ; then echo "Flash vbmeta error"; exit 1; fi

printf "\n\nIssue fixed... Flashing recovery and booting...\n\n" 

"`dirname $0`/../platform-tools/fastboot" flash recovery "`dirname $0`/../images/recovery_$1.img"
if [ $? -ne 0 ] ; then echo "Flash recovery error"; exit 1; fi

"`dirname $0`/../platform-tools/fastboot" boot "`dirname $0`/../images/recovery_$1.img"
