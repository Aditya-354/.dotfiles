#! /usr/bin/env bash

if pgrep -x waybar; then
    killall waybar
else
    waybar & disown
fi

