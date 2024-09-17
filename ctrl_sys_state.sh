#!/bin/bash
case $1 in 
    poweroff)
        poweroff
        ;;
    reboot)
        reboot
        ;;
    halt)
        halt
        ;;
    *)
        echo "incrorrect input"
        ;;
esac