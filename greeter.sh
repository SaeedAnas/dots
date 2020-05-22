#! /bin/zsh
pathlist=( /home/anas/color-scripts/color-scripts/*);
rand=$[$RANDOM % ${#pathlist[@]}]
  ${pathlist[$rand]}
  echo "\n"
  fortune
  echo "\n"
 
