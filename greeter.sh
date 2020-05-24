#! /bin/zsh
pathlist=( /home/anas/colorscripts/*);
rand=$[$RANDOM % ${#pathlist[@]}]
  ${pathlist[$rand]}
  echo "\n"
  fortune
  echo "\n"

