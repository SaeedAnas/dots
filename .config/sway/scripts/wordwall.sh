#!/bin/bash
while true 
do
echo "before generation";
python ~/code/scripts/wordwall-master/wordwall --logo=$1 --color='#cc241d' --color='#98971a' --color='#458588' --color='#b16286' --color='#d79921' --bg-color='#282828' /home/anas/walls/wallpaper.png;
echo "after genration";
swaymsg output "*" background /home/anas/walls/wallpaper.png fill;
echo "set as wallpaper";
sleep 7200
done
