#!/bin/bash
# Declare the Variables of colors
COLOR_RED="\e[31m"
COLOR_GREEN="\e[32m"
COLOR_YELLOW="\e[33m"
COLOR_BLUE="\e[34m"
COLOR_RESET="\e[0m"

get_current_day() {
    date +%-e
}
get_last_day() {
    date -d "$(date +'%Y-%m-01') +1 month -1 day" +%d
}
calculate_difference() {
    local current_day="$1"
    local last_day="$2"
    echo $((last_day - current_day))
}
get_random_color() {
    local colors=("$COLOR_GREEN" "$COLOR_RED" "$COLOR_YELLOW" "$COLOR_BLUE")
    local rand_index=$((RANDOM % ${#colors[@]}))
    echo "${colors[rand_index]}"
}
print_colored_message() {
    local message="$1"
    local color="$2"
    printf "${color}${message}${COLOR_RESET}\n"
}
is_number() {
    local input="$1"
    if [[ "$input" =~ ^[0-9]+$ ]]; then
        return 0  # It's a number
    else
        return 1  # It's not a number
    fi
}

# main function 
main() {
    local current_day=$(get_current_day)
    local last_day=$(get_last_day)
    local difference=$(calculate_difference "$current_day" "$last_day")
    local seconds=$(date +%S)
    local get_dir=$(dirname "$(realpath "$0")")
    local mood_path="${get_dir}/date_pressure/"

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
    printf "\tYou have ${color}%d${COLOR_RESET} days left!\n" "$difference"

    # Print mood message if file exists
    if [ -f "$mood_msg" ]; then
        local num_msg=$(wc -l < "$mood_msg")
        if [ "$num_msg" -gt 0 ]; then
            local indexing=$((1 + (seconds % num_msg)))
            local result_msg=$(sed -n "${indexing}p" "$mood_msg")
            print_colored_message "$result_msg" "$color"
        fi
    fi

    # Print random quote if file exists
    if [ -f "$quotes_file" ]; then
        local num_quotes=$(wc -l < "$quotes_file")
        if [ "$num_quotes" -gt 0 ]; then
            local times=1
            if [ -n "$1" ]; then 
              local times=$1
            fi
            if is_number "$times"; then
                for ((i=1; i<=times; i++)); do
                    local rand_index=$((i + (seconds % num_quotes)))
                    local random_quote=$(sed -n "${rand_index}p" "$quotes_file")
                    local random_color=$(get_random_color)
                    printf "\n${random_color}%s${COLOR_RESET}\n" "$random_quote"
                done
            else
                echo -e "${COLOR_RED}Error: Input is not a number."
            fi
        fi
    else
        echo -e "${COLOR_RED}Error: Quote file not found!${COLOR_RESET}"
    fi
}

# Call the main function with the provided argument
main "$@"