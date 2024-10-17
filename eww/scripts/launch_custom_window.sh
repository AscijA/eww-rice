#!/bin/bash

# Get the value from the argument
app_name="$1"
eww open --toggle backdrop_closer_$app_name 

eww open --toggle "$app_name"


