#!/bin/bash
class=$(playerctl metadata --format '{{lc(status)}}')
icon=""
paused="󰏤 "
beginning=$(</home/anas/.config/waybar/modules/beginning.txt)
end=$(</home/anas/.config/waybar/modules/ending.txt)
info=$(playerctl metadata --format '{{title}}')

 if [[ ${#info} -gt 20 ]]; then
    info=$(echo $info | cut -c$beginning-$end)"... "
  fi

  text=$info
if [[ $class == "paused" ]]; then
  text=$paused$info
fi


echo -e "{\"text\":\""$text"\", \"class\":\""$class"\"}"
# python ~/.config/waybar/modules/encoder.py "{\"text\":\""$text"\", \"class\":\""$class"\"}"
 
if [[ ${#info} > 20 ]]; then
  if [[ ${#info} < $((end)) ]]; then
    echo "1" > /home/anas/.config/waybar/modules/beginning.txt
  echo "20" > /home/anas/.config/waybar/modules/ending.txt
else 
  echo $((beginning + 2)) > /home/anas/.config/waybar/modules/beginning.txt
  echo $((end + 2)) > /home/anas/.config/waybar/modules/ending.txt
  fi
fi

