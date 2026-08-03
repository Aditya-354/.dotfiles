-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function ()
  hl.exec_cmd("waybar &")
  hl.exec_cmd("playerctl daemon")
  hl.exec_cmd("awww-daemon &")
  hl.exec_cmd("waypaper --restore")
  hl.exec_cmd("swaync")
  hl.exec_cmd("wl-clip-persist --clipboard regular")
end)
