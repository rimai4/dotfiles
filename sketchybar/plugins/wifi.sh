#!/bin/bash

# Function to get Wi-Fi status
get_wifi_status() {
    wifi_info=$(networksetup -getairportnetwork en0)
    if [[ $wifi_info =~ "currently off" ]]; then
        echo "off"
    else
        echo "on"
    fi
}

# Function to update Sketchybar item
update_sketchybar() {
    status=$1
    case $status in
        "on")
            sketchybar -m --set wifi icon="" label="" icon.color=0xffffffff
            ;;
        "off")
            sketchybar -m --set wifi icon="󰖪" label="" icon.color=0xffed8796
            ;;
    esac
}

# Main execution
wifi_status=$(get_wifi_status)
update_sketchybar $wifi_status
