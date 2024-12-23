# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
polybar -c ~/.config/polybar/config.ini right &
polybar -c ~/.config/polybar/config.ini center &
polybar -c ~/.config/polybar/config.ini left &
