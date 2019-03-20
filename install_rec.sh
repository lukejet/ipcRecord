#!/bin/bash

mkdir -p /var/record/

cp record.sh /usr/local/bin/
cp mg_recs.sh /usr/local/bin/

chmod + /usr/local/bin/record.sh
chmod + /usr/local/bin/mg_recs.sh

crontab -l > crontab.bak
echo "*/5 * * * * /usr/local/bin/record.sh 5" >> crontab.bak
echo "*/30 * * * * /usr/local/bin/mg_recs.sh" >> crontab.bak

crontab crontab.bak
/etc/init.d/cron restart

