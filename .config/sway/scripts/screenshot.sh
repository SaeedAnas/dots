#!/bin/bash
FILENAME="screenshot-`date +%F-%T`"

function region() {

grim -g "$(slurp)" ~/Pictures/Screenshots/$FILENAME.png

}

function full() {

grim ~/Pictures/Screenshots/$FILENAME.png

}

case $1 in
    full)
    $1  ;;
    region)
    $1  ;;
esac
