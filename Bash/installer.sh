#!/usr/bin/env bash

printf "\nDetecting your device[Make sure it is in fastboot mode{VOL DN+Power}]...\n\n"

"`dirname $0`/../platform-tools/fastboot" getvar product 2>&1 | grep "^product: *$1$"
if [ $? -ne 0 ] ; then echo "Device mismatch: $1"; exit 1; fi

if [ $1 == whyred ]
then
"`dirname $0`/../platform-tools/fastboot" flash antirbpass "`dirname $0`/../images/dummy_whyred.img"
if [ $? -ne 0 ] ; then echo "Flash dummy error"; exit 1; fi
fi

"`dirname $0`/../platform-tools/fastboot" flash recovery "`dirname $0`/../images/$1.img"
if [ $? -ne 0 ] ; then echo "Flash recovery error"; exit 1; fi

"`dirname $0`/../platform-tools/fastboot" boot "`dirname $0`/../images/$1.img"
