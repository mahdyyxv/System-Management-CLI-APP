#!/bin/bash
case $1 in
    num)
        case $2 in
            on)
            echo 1 > /sys/class/leds/input3::numlock/brightness
            ;;
            off)
            echo 0 > /sys/class/leds/input3::numlock/brightness
            ;;
            *)
            echo "incrorrect input"
            ;;
        esac
        ;;
    caps)
        case $2 in
            on)
            echo 1 > /sys/class/leds/input3::capslock/brightness
            ;;
            off)
            echo 0 > /sys/class/leds/input3::capslock/brightness
            ;;
            *)
            echo "incrorrect input"
            ;;
        esac
        ;;
    *)
        echo "incrorrect input"
        ;;
esac