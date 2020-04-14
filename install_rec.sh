#!/bin/bash

read -p "Please set rtsp url from your IPC Camera [rtsp://172.18.1.123/stream1] : " CAMURL
if [ -z "$CAMURL" ]; then
	CAMURL=rtsp://172.18.1.123/stream1
fi

read -p "Please set path for the record files [/var/record/] :" REC_PATH
if [ -z "$REC_PATH" ]; then
	REC_PATH=/var/record	
fi

echo $CAMURL 
echo $REC_PATH

echo "camurl: $CAMURL" > /etc/ipcrecord.conf
echo "rec_path: $REC_PATH" >> /etc/ipcrecord.conf

mkdir -p $REC_PATH

cp record.sh /usr/local/bin/
cp mg_recs.sh /usr/local/bin/

chmod + /usr/local/bin/record.sh
chmod + /usr/local/bin/mg_recs.sh

crontab -l > crontab.bak
echo "*/5 * * * * /usr/local/bin/record.sh 5" >> crontab.bak
echo "*/30 * * * * /usr/local/bin/mg_recs.sh" >> crontab.bak

#crontab crontab.bak
#/etc/init.d/cron restart

rm crontab.bak
