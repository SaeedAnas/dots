#!/bin/zsh

STATUS=$(ddcutil getvcp 10)
CURRENT=$(echo $STATUS | cut -d'=' -f2-3 | cut -d',' -f-1 | tr -d '[:space:]')
MAX=$(echo $STATUS | cut -d'=' -f3- | tr -d '[:space:]')

function set() {
  if [[ $1 -gt $MAX ]] ; then
    ddcutil setvcp 10 $MAX
    success $MAX
  elif [[ $1 < 0 ]] ; then
    ddcutil setvcp 10 0
    success 0
  else
  ddcutil setvcp 10 $1
  success $1
  fi
}

function success() {
  echo "Changed Brightness to $1"
}

function dec() {
  set $(($CURRENT - $1))
}

function inc() {
  set $(($CURRENT + $1))
}

function max() {
  set $MAX
}

function min() {
  set 0
}

function help() {
  echo "
A little shell script to change external monitor brightness

Usage: 
  sudo ./exten_brightness.sh (command) (value)

Commands: 
  inc (value) : increase brightness by amount
  dec (value) : decrease brightness by amount
  set (value) : set value to amount
  max         : set value to $MAX
  min         : set value to 0

  * Current   = $CURRENT
  * MAX       = $MAX
  "
}

case $1 in 
  inc)
    $1 $2;;
  dec)
    $1 $2;;
  set)
    $1 $2;;
  max)
    $1;;
  min)
    $1;;
  *)
    help;;
esac

