#!/bin/bash

# Declare the Variables
COLOR_RED="\e[31m"
COLOR_GREEN="\e[32m"
COLOR_YELLOW="\e[33m"
COLOR_BLUE="\e[34m"
COLOR_RESET="\e[0m"

# Call the calendar
cal

# Get the current day of the month (using base 10)
current_day=$((10#$(date +%e)))
# Get the last day of the month (using base 10)
last_day=$((10#$(date -d "$(date +'%Y-%m-01') +1 month -1 day" +%d)))
# Calculate the difference
difference=$((last_day - current_day))
# Current seconds
seconds=$(date +%S)

# Calculate Actual Path of engine.sh
the_path=$(realpath "$0")
get_dir=$(dirname "${the_path}")

# Get mood path
mood_path="${get_dir}/date_pressure/"

# Select color based on days difference
if ((difference <= 10)); then
    color="$COLOR_RED"
    quotes_file="${get_dir}/date_pressure/low.txt"
    mood_msg="${mood_path}mood.low.txt"
elif ((difference <= 20)); then
    quotes_file="${get_dir}/date_pressure/medium.txt"
    color="$COLOR_YELLOW"
    mood_msg="${mood_path}mood.medium.txt"
else
    quotes_file="${get_dir}/date_pressure/high.txt"
    color="$COLOR_GREEN"
    mood_msg="${mood_path}mood.high.txt"
fi

# Print the result with color
echo -e "\tYou have ${color}${difference}${COLOR_RESET} days left!"
if [ -f "$mood_msg" ]; then
    num_msg=$(wc -l < "$mood_msg")
    if [ "$num_msg" -gt 0 ]; then
        indexing=$((1 + (seconds % num_msg)))
        result_msg=$(sed -n "${indexing-1}p" "$mood_msg")
        echo -e "${color}${result_msg}${COLOR_RESET}"
    fi
fi

# Check if the file exists
if [ -f "$quotes_file" ]; then
    num_quotes=$(wc -l < "$quotes_file")
    if [ "$num_quotes" -gt 0 ]; then
        rand_index=$((1 + (seconds % num_quotes)))
        random_quote=$(sed -n "${rand_index-1}p" "$quotes_file")
        # Array of color codes
        COLOR_RANDOM=("$COLOR_GREEN" "$COLOR_RED" "$COLOR_YELLOW" "$COLOR_BLUE")
        # Select a random color
        rand_color_index=$((RANDOM % ${#COLOR_RANDOM[@]}))
        random_color="${COLOR_RANDOM[rand_color_index]}"
        # Print the quote with random color
        echo
        echo -e "${random_color}${random_quote}${COLOR_RESET}"
    fi
else
    echo -e "${COLOR_RED}Error: Quote file not found!${COLOR_RESET}"
fi