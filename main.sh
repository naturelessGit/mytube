#!/bin/bash

# Ask for URL or search
input_url=$(whiptail --title "Download" --inputbox "Enter a search term (prefix ytsearch:) or URL:" 10 60 "" 3>&1 1>&2 2>&3)

# Start yt-dlp and parse progress into gauge-friendly format
{
    ./yt-dlp --progress --newline "$input_url" 2>&1 | while IFS= read -r line; do
        if [[ "$line" =~ ([0-9]+(\.[0-9]+)?)% ]]; then
            percentage="${BASH_REMATCH[1]}"
            percentage_int="${percentage%.*}" # Get integer part only
            echo "$percentage_int"
        fi
    done
} | whiptail --gauge "Downloading..." 6 60 0
