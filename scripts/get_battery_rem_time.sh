#!/bin/bash

# Get the battery information
battery_info=$(acpi -i)

# Extract the state (Charging, Discharging, Full)
state=$(echo "$battery_info" | grep -Po '(?<=: )\w+' | head -n1)

# Extract the time remaining (if available)
time_remaining=$(echo "$battery_info" | grep -Po '\d+:\d+')

# # Extract the design capacity
# design_capacity=$(echo "$battery_info" | grep -Po 'design capacity \K\d+' | head -n1)

# Print the results
# echo "$state"

if [ -n "$time_remaining" ]; then
    echo "Remaining: $time_remaining"
else
    echo "Disconnect Charger"
fi

