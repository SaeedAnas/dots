#!/bin/sh


case "$1" in
    lock)
        swaylock --screenshots --effect-blur 10x3 --indicator --indicator-radius 150 --fade-in 0.1 --clock -e --inside-color 282c34 --ring-color 98c379 --inside-clear-color d19a66 --inside-wrong-color e06c75 --text-color abb2bf --inside-ver-color 61afef
        ;;
    logout)
        swaymsg exit
        ;;
    suspend)
        systemctl suspend
        ;;
    hibernate)
        systemctl hibernate
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
        exit 2
esac

exit 0


