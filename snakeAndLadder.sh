#! /bin/bash -x

echo "##### Welcome to Snake And Ladder game #####"
echo "Start play with Two Players"
# Constant in code
startPos=0
endPos=100

# Variables
play=0
pos=0
player=1
player1Play=0
player2Play=0

while [[ $startPos -ne $endPos ]]
do
		# Start Play with Player1
		rollDice=$((RANDOM%6+1))		# To get Dice face {1,2,3,4,5,6}
		option=$((RANDOM%3+1))			# To get option {1,2,3}

		noPlay=1
		ladder=2
		snake=3

		case $option in
				$noPlay)
						startPos=$startPos
						;;
				$ladder)
						startPos=$(( $startPos + $rollDice ))
						;;
				$snake)
						startPos=$(( $startPos - $rollDice ))
						;;
		esac
		(( play++ ))
		if [[ $startPos -lt 0 ]]
		then
				startPos=0
		elif [[ $startPos -gt 100 ]]
		then
				startPos=$prevPos
		fi
		prevPos=$startPos
#		sleep 0.1
		echo "Current Position of $player is : $prevPos"
		# To switch the player
		if [[ $player -eq 1 ]]
		then
				(( player1Play++ ))
				player=2
		else
				(( player2Play++ ))
				player=1
		fi
done
echo "Toatl Number of plays are : $play"
if [[ $player -eq 1 ]]
then
		echo "Number of plays of player2 is :$player2Play"
		echo "**** Player2 is Winner ****"
else
		echo "Number of plays of player1 is :$player1Play"
		echo "**** Player1 is Winner ****"
fi
