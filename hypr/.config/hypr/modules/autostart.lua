-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function ()
  hl.exec_cmd("waybar &")
  hl.exec_cmd("awww-daemon &")
  hl.exec_cmd("waypaper --restore")
  hl.exec_cmd("swaync")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme BreezeX-RosePine-Linux")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 28")
end)
