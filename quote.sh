#!/bin/bash
# Call the calendar for productivity 
cal
# Get the current day 
current_day=$(date +%d)

# Get the last day of the month
last_day=$(date -d "$(date +'%Y-%m-01') +1 month -1 day" +%d)

# Calculate the difference
difference=$((last_day - current_day))

# Choose color based on the number of days left
if ((difference <= 10)); then
    color="\e[31m"  
    msg="Hurry up! You have no time!"
elif ((difference <= 20)); then
    color="\e[33m"   
    msg="Beware! Time is coming..."
else
    color="\e[32m"  
    msg="Remember... It's better growing 1% per day than do nothing!"
fi

# Print the result with color
echo -e "\tYou have \e[0m${color}${difference}\e[0m days left!"
echo -e "\t\e[0m${color}${msg}\e[0m"

# Random quotes
quotes=("Time is what we want most, but what we use worst." 
        "Lost time is never found again." 
        "The trouble is, you think you have time." 
        "The bad news is time flies. The good news is you're the pilot."
        "You have power over your mind - not outside events. Realize this, and you will find strength. - Marcus Aurelius"
        "Waste no more time arguing about what a good man should be. Be one. - Marcus Aurelius"
        "The happiness of your life depends upon the quality of your thoughts. - Marcus Aurelius"
        "You have to accept whatever comes and the only important thing is that you meet it with courage and with the best that you have to give. - Eleanor Roosevelt"
        "We suffer more often in imagination than in reality. - Seneca"
        "Luck is what happens when preparation meets opportunity. - Seneca"
        "The only way to do great work is to love what you do. - Steve Jobs"
        "Success is not final, failure is not fatal: It is the courage to continue that counts. - Winston Churchill"
        "The only limit to our realization of tomorrow will be our doubts of today. - Franklin D. Roosevelt"
        "You miss 100% of the shots you don't take. - Wayne Gretzky"
        "The best time to plant a tree was 20 years ago. The second best time is now. - Chinese Proverb"
        "It does not matter how slowly you go as long as you do not stop. - Confucius"
        "Success is stumbling from failure to failure with no loss of enthusiasm. - Winston Churchill"
        "Our greatest glory is not in never falling, but in rising every time we fall. - Confucius"
        "Your work is going to fill a large part of your life, and the only way to be truly satisfied is to do what you believe is great work. And the only way to do great work is to love what you do. - Steve Jobs"
        "The secret of getting ahead is getting started. - Mark Twain"
        "The only way to achieve the impossible is to believe it is possible. - Charles Kingsleigh"
        "Success is not the key to happiness. Happiness is the key to success. If you love what you are doing, you will be successful. - Albert Schweitzer"
        "You are never too old to set another goal or to dream a new dream. - C.S. Lewis"
        "The man who moves a mountain begins by carrying away small stones. - Confucius"
        "The way to get started is to quit talking and begin doing. - Walt Disney"
        "Believe you can and you're halfway there. - Theodore Roosevelt"
        "The only person you should try to be better than is the person you were yesterday. - Anonymous"
        "The only limit to our realization of tomorrow will be our doubts of today. - Franklin D. Roosevelt"
        "Success is not the key to happiness. Happiness is the key to success. If you love what you are doing, you will be successful. - Albert Schweitzer"
        "You don't have to be great to start, but you have to start to be great. - Zig Ziglar"
        "The journey of a thousand miles begins with one step. - Lao Tzu"
        "If you want to achieve greatness stop asking for permission. - Anonymous")
rand_index=$((RANDOM % ${#quotes[@]}))
echo -e "\t\e[0m${color}${quotes[$rand_index]}\e[0m"