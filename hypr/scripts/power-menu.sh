#!/bin/bash

choice=$(printf '%s\n' \
    '󰌾  Lock' \
    '󰤄  Suspend' \
    '󰍃  Logout' \
    '󰜉  Reboot' \
    '󰐥  Shutdown' \
    '󰜺  Cancel' |
    fuzzel --dmenu --prompt 'Power  ')

case "$choice" in
    '󰌾  Lock')
        hyprlock
        ;;

    '󰤄  Suspend')
        systemctl suspend
        ;;

    '󰍃  Logout')
        hyprshutdown
        ;;

    '󰜉  Reboot')
        hyprshutdown \
            -t 'Restarting...' \
            --post-cmd 'reboot'
        ;;

    '󰐥  Shutdown')
        hyprshutdown \
            -t 'Shutting down...' \
            --post-cmd 'shutdown -P 0'
        ;;

    *)
        exit 0
        ;;
esac
