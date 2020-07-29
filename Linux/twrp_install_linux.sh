#!/usr/bin/env bash

printf "\n\n\nTWRP Installer 0.1 by @uncannyjish\n\n"

printf "\nDetecting your device[Make sure it is in fastboot mode{VOL DN+Power}]...\n\n"

"`dirname $0`/platform-tools/fastboot" $* getvar product 2>&1 | grep "^product: *ginkgo$"
if [ $? -ne 0 ] ; then echo "Device mismatch"; exit 1; fi

"`dirname $0`/platform-tools/fastboot" $* flash recovery "`dirname $0`/../images/recovery_ginkgo.img"
if [ $? -ne 0 ] ; then echo "Flash recovery error"; exit 1; fi

"`dirname $0`/platform-tools/fastboot" $* boot "`dirname $0`/../images/recovery_ginkgo.img"
