#! /bin/bash -x

echo "##### Welcome to Snake And Ladder game #####"
echo "Player1 start play"
# Constant in code
endPos=100

# Variables
play=0
startPos=0


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
		sleep 0.1
		echo "Current Position is : $prevPos"
done

echo "Number of plays are : $play"
