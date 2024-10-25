#!/bin/bash


# Function to get the active window ID
get_active_window_id() {
  xdotool getactivewindow
}

# Function to minimize the active window
minimize_window() {
  window_id=$(get_active_window_id)
  if [ -n "$window_id" ]; then
    wmctrl -i -r "$window_id" -b add,hidden
  fi
}

# Function to toggle maximize/restore the active window
toggle_maximize_window() {
  window_id=$(get_active_window_id)
  if [ -n "$window_id" ]; then
    # Toggle both vertical and horizontal maximization
    wmctrl -i -r "$window_id" -b toggle,maximized_vert,maximized_horz
  fi
}

# Function to close the active window
close_window() {
  window_id=$(get_active_window_id)
  if [ -n "$window_id" ]; then
    wmctrl -i -c "$window_id"
  fi
}

double_click_maximize(){
  c_count=$((c_count + 1))
  eww update CLICK_COUNT=$c_count

  if [ "$c_count" -eq 2 ]; then
    toggle_maximize_window
    eww update CLICK_COUNT=0
  fi
}

# Check for user input and execute the correct function
# if [ "$#" -lt 1 ]; then
#   echo "Usage: $0 {minimize|maximize|close}"
#   exit 1
# fi

action=$1
c_count=$2
case $action in
  minimize)
    minimize_window
    ;;
  maximize)
    toggle_maximize_window
    ;;
  close)
    close_window
    ;;
  bar_click)
    double_click_maximize
    ;;  
  *)
    exit 1
    ;;
esac


