#!/bin/bash -x

echo "Welcome to Snake and Ladder game."
#Constants
START_POSITION=0
END_POSITION=100

#Variables
currentPosition=0
nextPosition=0
snakePosition=0
numberOfDie=0

#Case 2 : Ladder climbing
function ladderClimbUp()
{
	nextPosition=$1
   #if your nextPosition is greater than EndPosition (ex. 103>100)
	if [[ $nextPosition -gt $END_POSITION ]]
	then
		currentPosition=$currentPosition
	else
		currentPosition=$nextPosition
	fi
	arrayOfDie[$numberOfDie]=$currentPosition
	echo $currentPosition
}

#Case 3 : Snake Bites 
function ladderClimbDown()
{
	snakePosition=$1
   #at start of game if snake bites currentPosition will be in -ve(ex. -2)
	if [[ $snakePosition -lt $START_POSITION ]]
	then
		currentPosition=$currentPosition
	else
		currentPosition=$snakePosition
	fi
	echo $currentPosition
}

echo "Player roll a die: "

while [[ $currentPosition -lt $END_POSITION ]]
do
	dieRandom=$((RANDOM%6+1))
	choiceRandom=$((RANDOM%3+1))

	case $choiceRandom in
	1)
	echo "No Play."
	currentPosition=$currentPosition
	;;
	2)
	echo "Ladder."
	nextPosition=$((currentPosition+dieRandom))
	numberOfDie=$((numberOfDie+1))
	currentPosition=$( ladderClimbUp $nextPosition )
	arrayOfDie[$numberOfDie]=$currentPosition
	;;
	3)
	echo "Snake bites"
	snakePosition=$((currentPosition-dieRandom))
	currentPosition=$( ladderClimbDown $snakePosition )
	;;
	esac
done

echo "${!arrayOfDie[@]} :${arrayOfDie[@]}"
