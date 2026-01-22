#!/bin/bash

# Monitor descriptions (exact from your config)
HOME_RIGHT="LG Electronics LG ULTRAGEAR 304MARZDBV22"
HOME_LEFT="Acer Technologies CB271HU T85EE0018511"
PRAXIS_RIGHT="Lenovo Group Limited T27i-30 V5WWR975"
PRAXIS_LEFT="BOE 0x095F"

# Function to apply rules
apply_rules() {
    local primary="$1"
    local secondary="$2"
    local setup_name="$3"

    hyprctl keyword workspace "1, monitor:desc:$primary, default:true"
    hyprctl keyword workspace "3, monitor:desc:$primary"
    hyprctl keyword workspace "5, monitor:desc:$primary"
    hyprctl keyword workspace "2, monitor:desc:$secondary, default:true"
    hyprctl keyword workspace "4, monitor:desc:$secondary"
    hyprctl keyword workspace "6, monitor:desc:$secondary"

    # Force move existing workspaces to correct monitors
    hyprctl dispatch moveworkspacetomonitor "1 desc:$primary"
    hyprctl dispatch moveworkspacetomonitor "3 desc:$primary"
    hyprctl dispatch moveworkspacetomonitor "5 desc:$primary"
    hyprctl dispatch moveworkspacetomonitor "2 desc:$secondary"
    hyprctl dispatch moveworkspacetomonitor "4 desc:$secondary"
    hyprctl dispatch moveworkspacetomonitor "6 desc:$secondary"

    notify-send "Applied $setup_name workspace rules" -t 10000
}

# Detect setup (prioritizes most specific first)
monitors=$(hyprctl monitors -j | jq -r '.[].description')

if echo "$monitors" | grep -q "$HOME_RIGHT"; then
    apply_rules "$HOME_RIGHT" "$HOME_LEFT" "HOME"
elif echo "$monitors" | grep -q "$PRAXIS_RIGHT"; then
    apply_rules "$PRAXIS_RIGHT" "$PRAXIS_LEFT" "PRAXIS"
else
    notify-send "No known setup detected" -t 10000
fi
