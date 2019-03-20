#!/bin/bash

mkdir -p /var/record/

crontab -l > crontab.bak
echo "*/5 * * * * /usr/local/bin/record.sh 5" >> crontab.bak
echo "*/30 * * * * /usr/local/bin/mg_recs.sh" >> crontab.bak

crontab crontab.bak
/etc/init.d/cron restart

