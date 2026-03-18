#!/bin/bash

# These are the 8 levels of the block bars for the EQ effect
bars=(" " "▂" "▃" "▄" "▅" "▆" "▇" "█")

while true; do
    # Get the current player status
    status=$(playerctl status 2>/dev/null)
    
    if [ "$status" = "Playing" ]; then
        # Pick 3 random bars for the EQ effect
        b1=${bars[$RANDOM % 8]}
        b2=${bars[$RANDOM % 8]}
        b3=${bars[$RANDOM % 8]}
        
        metadata=$(playerctl metadata --format "{{title}} - {{artist}}")
        
        # Output: [3-Bar EQ] Title - Artist
        echo "$b1$b2$b3 $metadata"
        
    elif [ "$status" = "Paused" ]; then
        # Get metadata even when paused
        metadata=$(playerctl metadata --format "{{title}} - {{artist}}")
        
        # Output: [Pause Icon] Title - Artist
        # Added an extra space after the emoji to keep width consistent
        echo "⏸  $metadata"
        
    else
        # If no music is detected at all, clear the bar
        echo ""
    fi
    
    # Refresh rate (0.1s makes the EQ look active)
    sleep 0.1
done
