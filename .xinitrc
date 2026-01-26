# Start user D-Bus session if not already running
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
  eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi

# Clipboard Manager
greenclip daemon &
#clipmenud &

# Hotkey Manager
sxhkd &

# Notification Manager
dunst &

# create a Terminal
exec kitty &

# Tiling Window Manager
exec bspwm




