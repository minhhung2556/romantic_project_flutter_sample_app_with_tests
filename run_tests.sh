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

flutter test test/home_page_bloc_test.dart && flutter test test/home_page_test.dart && flutter drive --target=test_driver/app.dart --driver=test_driver/app_test.dart