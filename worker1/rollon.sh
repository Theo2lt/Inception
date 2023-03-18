#! /bin/bash
x=0
while true
do
echo $x > /var/www/html/worker1.txt
((x=x+1))
php /affichage.php
sleep 2
done