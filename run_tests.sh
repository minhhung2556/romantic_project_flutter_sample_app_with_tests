#!/bin/bash

clear
BASEDIR=$(dirname $0)
echo "Script location: ${BASEDIR}"

NEED_UPDATE=""$1

if [ $BASEDIR != "." ]
then
    cd $BASEDIR
fi

updateCode() {
    flutter packages get
}

clean() {
    flutter clean
}

if [ "$NEED_UPDATE" != "0" ]
then
  updateCode
  clean
else
  echo "no need to update"
fi

runUnitTests() {
    flutter test test/home_page_bloc_test.dart
}

runWidgetTests() {
	flutter test test/home_page_test.dart	
}

runIntegrationTests() {
	devicesStr=$(flutter devices)
	echo $devicesStr

	devicesArray=(${devicesStr// • / })

	devices=()
	deviceCount=0
	for (( i=0; i<${#devicesArray[@]}; i++ ))
	do
		item=${devicesArray[$i]}
		# echo "item $i: $item"
		if [ $i>0 ]; then
			if [[ $item == android-* ]] || [[ $item == "ios" ]]; then
				j=$((i-1))
				# echo "j: $j"
				devices[$deviceCount]=${devicesArray[j]}
				echo "devices[$deviceCount]: ${devices[$deviceCount]}"
				((deviceCount++))
			fi
			if [[ $item == "chrome" ]]; then
				devices[$deviceCount]=$item
				echo "devices[$deviceCount]: ${devices[$deviceCount]}"
				((deviceCount++))
			fi
	   	fi
	done

	for (( i=0; i<$deviceCount; i++ ))
	do
		item=${devices[$i]}
		echo "run test on $item"

		if [[ $item == "chrome" ]]; then
			flutter drive --target=test_driver/app.dart --keep-app-running -d $item --browser-name=$item --profile
		else
			flutter drive --target=test_driver/app.dart --keep-app-running -d $item		
		fi
	done
}

runUnitTests
runWidgetTests
runIntegrationTests



