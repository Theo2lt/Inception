#!/bin/sh


service vsftpd start
# Add the USER, change his password and declare him as the owner of wordpress folder and all subfolders

adduser FTP_USER --home /home/FTP_USER 
echo "FTP_USER:123" | /usr/sbin/chpasswd



sudo chown FTP_USER:FTP_USER -R /home/FTP_USER/
echo "FTP_USER" | tee -a /etc/vsftpd.userlist 



echo "anonymous_enable=NO
local_enable=YES
write_enable=YES
dirmessage_enable=YES
xferlog_enable=YES
connect_from_port_20=NO
xferlog_std_format=YES
chroot_local_user=YES
allow_writeable_chroot=YES
chroot_list_file=/etc/vsftpd/chroot_list
listen=YES
pam_service_name=vsftpd
userlist_enable=YES
userlist_file=/etc/vsftpd/user_list
userlist_deny=NO
listen_port=10021
pasv_enable=YES
pasv_min_port=21000
pasv_max_port=21999
pasv_addr_resolve=NO" > /etc/vsftpd.conf

service vsftpd stop

/usr/sbin/vsftpd