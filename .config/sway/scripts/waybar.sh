#!/bin/bash
function restart_program() {
    local program=$1
    killall -q $program
    # wait until the processes have been shut down
    while pgrep -u $UID -x $program >/dev/null; do sleep 1; done
    $2
}

function restart_waybar() {
    restart_program waybar "waybar"
}

function restart_flashfocus() {
    restart_program flashfocus "flashfocus --config /home/anas/.config/flashfocus/flashfocus.yml"

}
export GTK_THEME=Materia-Dark
restart_waybar
restart_flashfocus
#sudo caps2esc
