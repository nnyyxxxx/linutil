#!/bin/sh -e

. ./utility_functions.sh

# Function to reset scaling back to 1 (native resolution) for all monitors
reset_scaling() {
    echo "${BLUE}=========================================${RESET}"
    echo "${BLUE}  Reset Monitor Scaling to Native Resolution${RESET}"
    echo "${BLUE}=========================================${RESET}"

    monitor_list=$(detect_connected_monitors)
    IFS=$'\n' read -r -a monitor_array <<<"$monitor_list"

    for monitor in "${monitor_array[@]}"; do
        echo "${CYAN}Resetting scaling for $monitor to 1x1 (native resolution)${RESET}"
        execute_command "xrandr --output $monitor --scale 1x1"
    done

    echo "${GREEN}All monitor scalings have been reset to 1x1.${RESET}"
}

# Call the reset_scaling function
reset_scaling
