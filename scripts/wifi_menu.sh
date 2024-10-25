# Function to retrieve WiFi networks and return as JSON
retrieve_wifi_networks() {
  nmcli -f SSID,SIGNAL,SECURITY device wifi list | awk '
    BEGIN {
      print "["
      first = 1
    }
    NR > 1 {
      if (first == 0) print ","
      print "  {"
      print "    \"ssid\": \"" $1 "\","
      print "    \"signal_strength\": " $2 ","
      print "    \"secure\": \"" ($3 != "--" ? "true" : "false") "\""
      print "  }"
      first = 0
    }
    END {
      print "]"
    }
  '
}

# Function to refresh WiFi networks (rescan)
refresh_wifi_networks() {
  echo "Refreshing WiFi networks..."
  nmcli device wifi rescan
}

# Function to connect to WiFi
connect_to_wifi() {
  local ssid="$1"
  local password="$2"

  # Check if the network is already saved
  if nmcli -g NAME connection show | grep -q "^$ssid$"; then
    echo "Activating saved network: $ssid"
    nmcli connection up "$ssid"
  else
    # If the network is open, no password required
    if [ -z "$password" ]; then
      echo "Connecting to open network: $ssid"
      nmcli device wifi connect "$ssid"
    else
      echo "Connecting to secure network: $ssid"
      nmcli device wifi connect "$ssid" password "$password"
    fi
  fi
}

# Function to disconnect from the current WiFi
disconnect_wifi() {
  local device
  device=$(nmcli -t -f DEVICE,TYPE device | grep ":wifi" | cut -d: -f1 | head -n 1)

  if [ -n "$device" ]; then
    echo "Disconnecting WiFi from device: $device"
    nmcli device disconnect "$device"
  else
    echo "No WiFi device found to disconnect."
  fi
}

# Main script logic
if [ "$1" == "scan" ]; then
  retrieve_wifi_networks
elif [ "$1" == "connect" ]; then
  if [ -z "$2" ]; then
    echo "Usage: $0 connect <SSID> [password]"
    exit 1
  fi
  connect_to_wifi "$2" "$3"
elif [ "$1" == "disconnect" ]; then
  disconnect_wifi
elif [ "$1" == "refresh" ]; then
  refresh_wifi_networks
else
  echo "Usage: $0 scan | connect <SSID> [password] | disconnect | refresh"
fi