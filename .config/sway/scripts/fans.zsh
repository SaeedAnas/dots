#! /bin/zsh

MAX_SPEED=$(cat /sys/devices/platform/applesmc.768/fan*_max)
MIN_SPEED=$(cat /sys/devices/platform/applesmc.768/fan*_min)

FILE=/etc/mbpfan.conf
SERVICE=mbpfan.service
TEST_STRING="min=1000"
SUFFIX=\_fan1_speed=

function find() {
	local var=$1$SUFFIX 
	echo "${$(cat /etc/mbpfan.conf | rg "$var")//"$var"/}"
}

function inc() {
	local orig=$(find $1)

	local sum=$(($orig + $2))

	if [[ $sum > $MAX_SPEED ]] ; then

		changeRamp $1 $MAX_SPEED
	else 

		changeRamp $1 $sum

	fi
}
function dec() {
	local orig=$(find $1)

	local diff=$(($orig - $2))

	if [[ $diff < $MIN_SPEED ]] ; then
		changeRamp $1 $MIN_SPEED

	else 
		changeRamp $1 $diff

	fi
}

function max() {
	changeRamp min $MAX_SPEED
    changeRamp max $MAX_SPEED
	submit
}

function setSpeed() {
    if [[ $2 > $MAX_SPEED ]] ; then
        changeRamp $1 $MAX_SPEED
    elif [[ $2 < $MIN_SPEED ]] ; then
        changeRamp $1 $MIN_SPEED
    else 
        changeRamp $1 $2
    fi
    submit
}

function min() {
	changeRamp min $MIN_SPEED
    changeRamp max $MAX_SPEED
	submit
}

function quiet() {
    changeRamp min 3800
    changeRamp max $MAX_SPEED
    submit
}

function silent() {
    changeRamp min $MIN_SPEED
    changeRamp max 3500
    submit
    
}
function changeRamp() {
	local VAR=$1$SUFFIX
	local NUM=$2
	sudo sed -i "s/${VAR}.*/${VAR}${NUM}/" $FILE
}

function submit() {
	sudo systemctl restart mbpfan.service
}

function help() {
	echo "A little shell script to automate fan speed
        Modes:
            max
            min
		Options: 
        inc (mode)(num) : increase fan speed by amount
        dec (mode) (num) : decrease fan speed by amount 
		"
}

case $1 in 
inc)
	$1 $2 $3;;
dec)
	$1 $2 $3;;
max)
    $1	;;
min)
	$1	;;
submit)
	$1	;;
setSpeed)
    $1 $2 $3;;
quiet)
    $1;;
silent)
    $1;;
*)
	help	;;
esac
