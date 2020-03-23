#!/bin/bash -x

echo "Welcome to Snake and Ladder game."
#Constants
START_POSITION=0
END_POSITION=100

#Variables
currentPosition=0

echo "Player roll a die: "

dieRoll=$((RANDOM%6+1))
choice=$((RANDOM%3+1))

case $choice in
	1)
	echo "No Play."
	currentPosition=$currentPosition
	;;
	2)
	echo "Ladder."
	currentPosition=$((currentPosition+dieRoll))
	;;
	3)
	echo "Snake bites"
	if [[ $dieRoll>$currentPosition ]]
	then
		currentPosition=$currentPosition
	else
		currentPosition=$((currentPosition-dieRoll))
	fi
	;;
esac
