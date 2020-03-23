#!/bin/bash -x

echo "Welcome to Snake and Ladder game."
#Constants
START_POSITION=0
END_POSITION=100

#Variables
currentPosition=0

echo "Player roll a die: "

dieRoll=$((RANDOM%6+1))

