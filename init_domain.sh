#!/bin/bash

echo "### Enter the server IP ###"
read ip;
i=0

while [ $i -le 10 ]
do
    if grep -q "web$i.tliot.42.fr" /etc/hosts; then
        echo "web$i.tliot.42.fr exist !"
    else
        echo "web$i.tliot.42.fr create "
        echo "$ip web$i.tliot.42.fr" >> /etc/hosts
    fi
  ((i++))
done


if grep -q "adminer.tliot.42.fr" /etc/hosts; then
    echo "adminer.tliot.42.fr exist !"
else
    echo "adminer.tliot.42.fr create "
    echo "$ip adminer.tliot.42.fr" >> /etc/hosts
fi

if grep -q -E "^tliot.42.fr$" /etc/hosts; then
    echo "tliot.42.fr exist !"
else
    echo "tliot.42.fr create "
    echo "$ip tliot.42.fr" >> /etc/hosts
fi