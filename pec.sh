#!/bin/bash

curl -o original.html http://wiki.di.uminho.pt/twiki/bin/view/Education/PeC/IeC1213 &> /dev/null
curl -o pec.html http://wiki.di.uminho.pt/twiki/bin/view/Education/PeC/IeC1213 &> /dev/null
FLAG=0

until [ $FLAG -eq 1 ]; do
 if diff original.html pec.html > /dev/null; then
   echo -e '\nNOTHING \n\n\n'
   curl -o pec.html http://wiki.di.uminho.pt/twiki/bin/view/Education/PeC/IeC1213 &> /dev/null
   sleep 15
  else
   echo '----***----SAIU----***----'
   echo '----***----SAIU----***----'
   echo '----***----SAIU----***----'
   echo '----***----SAIU----***----'
   date > data
   curl -s   -F "token=YOURTOKEN"   -F "user=YOURUSERTOKEN"   -F "message=GRADES ARE OUT!!!"   https://api.pushover.net/1/messages.json
   mpg123 --loop -1 beep.mp3
   FLAG=1
 fi
done
