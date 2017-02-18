#!/bin/bash

IP=YOUR_TV_IP
MAC="YOUR_TV_MAC"
HOME="AAAAAQAAAAEAAABgAw=="
UP="AAAAAQAAAAEAAAB0Aw=="
DOWN="AAAAAQAAAAEAAAB1Aw=="
LEFT="AAAAAQAAAAEAAAA0Aw=="
RIGHT="AAAAAQAAAAEAAAAzAw=="
CONFIRM="AAAAAQAAAAEAAABlAw=="

function sendCmd {
  ./send_command.sh $IP $1
  sleep 1
}

wakeonlan -i $IP $MAC
sleep 5
sendCmd $HOME
for i in {1..5}; do sendCmd $UP; done
for i in {1..10}; do sendCmd $LEFT; done
for i in {1..4}; do sendCmd $RIGHT; done
sendCmd $DOWN
sendCmd $CONFIRM
sleep 20
sendCmd $CONFIRM
