#!/usr/bin/env bash

# Options
shutdown="   Shutdown"
reboot="   Reboot"
lock="   Lock"
suspend="   Suspend"
logout="   Log Out"

# Variable passed to rofi
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

# Custom inline Nord configuration to ensure items actually render
chosen=$(echo -e "$options" | rofi -dmenu -p "Power Menu:" -theme-str '
  * {
    background-color: #2e3440;
    text-color: #d8dee9;
    font: "JetBrainsMono Nerd Font 12";
  }
  window {
    width: 350px;
    border: 2px;
    border-color: #88c0d0;
    border-radius: 8px;
    padding: 15px;
  }
  listview {
    lines: 5;
    scrollbar: false;
    margin: 10px 0px 0px 0px;
  }
  element {
    padding: 8px;
    border-radius: 4px;
  }
  element selected {
    background-color: #434c5e;
    text-color: #88c0d0;
  }
  inputbar {
    enabled: true;
    padding: 4px;
    children: [ prompt ];
  }
')

case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        hyprlock || swaylock
        ;;
    $suspend)
        systemctl suspend
        ;;
    $logout)
        loginctl terminate-user $USER
        ;;
esac
