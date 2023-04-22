#!/bin/sh


service vsftpd start

useradd -m $FTP_USER
echo  $FTP_USER:$FTP_PASSWORD | /usr/sbin/chpasswd
chown $FTP_USER:$FTP_USER -R /home/user/
echo  $FTP_USER | tee -a /etc/vsftpd.userlist 
service vsftpd stop

/usr/sbin/vsftpd