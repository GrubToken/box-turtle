#!/bin/bash
node=192.99.206.62

clear
echo ""
echo ""
echo -n "Enter Wallet Name: "
read walletname
echo -n "Enter Wallet Password: "
read walletpassword


create_new_wallet () {
  ./scripts/GRUB-service -g -w ./scripts/$walletname -p $walletpassword --rpc-password test --daemon-address $node --enable-cors "*"
}

start_turtle_service () {
  ./scripts/GRUB-service -w ./scripts/$walletname -p $walletpassword --rpc-password test --daemon-address $node --enable-cors "*" &
}

start_box_turtle () {
  xdg-open ./scripts/index.html
}

if [ -e "./scripts/${walletname}" ]
then
  start_GRUB_service
  start_box_turtle
else
  create_new_wallet
  start_GRUB_service
  start_box_turtle
fi;
