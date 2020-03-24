#! /bin/bash -x

echo "##### Welcome to Snake And Ladder game #####"
echo "Start play with Two Players"

# Constant in code
startPos=0
endPos=100
noPlay=1
ladder=2
snake=3

# Variables
play=0
player=1
player1Pos=$startPos
player2Pos=$startPos
tempPos=0

# Function to get Current Position of Players
function currentPosition()
{
		echo "Current Positions are : Player1=$player1Pos Player2=$player2Pos"
}

# Function to roll Dice
function rollDice()
{
		rollDice=$(( RANDOM%6+1 ))                # To get Dice face {1,2,3,4,5,6}
		moveOption=$(( RANDOM%3+1 ))                  # To get option {1,2,3}
}

# Start Play 
while [[ $player1Pos -ne $endPos && $player2Pos -ne $endPos ]]
do
		currentPosition
		rollDice
		(( play++ ))

		# To switch the player
		if [[ $player -eq 1 ]]
		then
				tempPos=$player1Pos
				#player=2
		else
				tempPos=$player2Pos
				#player=1
		fi

		case $moveOption in
				$noPlay)
						echo "Player$player stay at current position $tempPos"
				#		startPos=$startPos
						;;
				$ladder)
						if [[ $(( $tempPos + $rollDice )) -le $endPos ]]
						then
								tempPos=$(( $tempPos + $rollDice ))
								echo "Player$player moves forward by $rollDice position "
						else
								echo " Player$player stays at same positon because it exceed winning position"
						fi
						;;
				$snake)
						if [[ $(( $tempPos - $rollDice )) -lt $startPos ]]
						then
								tempPos=$statPos
								echo "Player$player come back to starting position "
						else
								tempPos=$(( $tempPos - $rollDice ))
								echo "Player$player moves backward by $rollDice position"
						fi
						;;
		esac

		if [[ $player -eq 1 ]]
		then
				player1Pos=$tempPos
		else
				player2Pos=$tempPos
		fi
		player=$(( 3- $player ))
done

echo "Total Number of plays are : $play"

currentPosition

if [[ $player1Pos -eq $endPos ]]
then
		echo "**** Player1 is Winner ****"
else
		echo "**** Player2 is Winner ****"
fi


