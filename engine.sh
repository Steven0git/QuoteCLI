#!/bin/bash
# Declare the Variables
export COLOR_RED="\e[31m"
export COLOR_GREEN="\e[32m"
export COLOR_YELLOW="\e[33m"
export COLOR_BLUE="\e[34m"

# Call the calendar
cal

# Get the current day of the month
 current_day=$(date +%e)
# Get the last day of the month
last_day=$(date -d "$(date +'%Y-%m-01') +1 month -1 day" +%d)
# Calculate the difference
difference=$((last_day - current_day))

#current seconds
seconds=$(date +%S)

# Select color based on days difference 
if ((difference <= 10)); then
    color=$COLOR_RED  
    msg="Hurry up! You have no time!"
elif ((difference <= 20)); then
    color=$COLOR_YELLOW   
    msg="Beware! Time is coming..."
else
    color=$COLOR_GREEN
    msg="Progressing by 1% each day is preferable to standing still."
fi

# Print the result with color
echo -e "\tYou have \e[0m${color}${difference}\e[0m days left!"
echo -e "\t\e[0m${color}${msg}\e[0m"

#Calcuale Actual Path of engine.sh
the_path=$(realpath "$0")
get_dir=$(dirname "${the_path}")
#get quote path
quotes_file="${get_dir}/quote.txt"

# Check if the file exists
if [ -f "$quotes_file" ]; then
    num_quotes=$(wc -l < "$quotes_file")
    rand_index=$((1 + (seconds * RANDOM % num_quotes)))
    random_quote=$(sed -n "${rand_index}p" "$quotes_file")
    # Array of color codes
    COLOR_RANDOM=("$COLOR_GREEN" "$COLOR_RED" "$COLOR_YELLOW" "$COLOR_BLUE")
    # Select a random color
    rand_color_index=$((RANDOM % ${#COLOR_RANDOM[@]}))
    random_color="${COLOR_RANDOM[rand_color_index]}"
    # Print the quote with random color
    echo
    echo -e "\e[0m${random_color}${random_quote}\e[0m"
else
    echo -e "\e[0m${COLOR_RED}Error: Quote file not found!\e[0m"
fi
 