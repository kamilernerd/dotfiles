#!/usr/bin/env bash

# Lid is open use lid monitor only
if grep open /proc/acpi/button/lid/LID0/state; then
    hyprctl keyword monitor "eDP-1, 2560x1440@165, 0x0, 1"
else
    if [[ `hyprctl monitors | grep "Monitor" | wc -l` != 1 ]]; then
        hyprctl keyword monitor "eDP-1, disable"

				if [ $1 == "stack" ]; then
					echo "Running monitors in stack"
					hyprctl keyword monitor "DP-1, 1920x1080@60, 0x1080, 1"
					hyprctl keyword monitor "HDMI-A-1, 1920x1080@60, 0x0, 1"
					killal hyprpaper && hyprpaper &
				elif [ $1 == "sidebyside" ]; then
					echo "Running monitors sidebyside"
					hyprctl keyword monitor "DP-1, 1920x1080@60, 1920x0, 1"
					hyprctl keyword monitor "HDMI-A-1, 1920x1080@60, 0x0, 1"
					killal hyprpaper && hyprpaper &
				fi
    fi
fi
