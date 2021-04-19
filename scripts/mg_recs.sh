#!/bin/bash

IPC_NAME=$1
REC_PATH=/var/record/$IPC_NAME

# manage records by date

function archieve_video_files
{
# move the old video files to the old day directory.

CUR_SEC=`date +%s`
YESTERDAY=`expr ${CUR_SEC} - 86400`
YESTERDAY=`date -d "@${YESTERDAY}" +%y%m%d`
YDAY_DIR=/var/record/$IPC_NAME/${IPC_NAME}_$YESTERDAY/
mkdir -p $YDAY_DIR

FILES=${REC_PATH}/${IPC_NAME}_${YESTERDAY}*

mv $FILES $YDAY_DIR

}

function manage_date
{
#remove all the files in the last day. by day or by hours.
echo "manage the record files by date."

#DAY=`date +%d`
#DAY=`expr ${DAY} - 2`

#HOUR=`date +%H`

CUR_SEC=`date +%s`
# 864000secs is 10days
OLD_SEC=`expr ${CUR_SEC} - 864000`
OLD_TIME=`date -d "@${OLD_SEC}" +%T`

echo $OLD_TIME

FILES=${REC_PATH}/${IPC_NAME}_`date -d "@${OLD_SEC}" +%y%m%d_%H`_*

echo "will remove old record files $FILES ..."
rm -rf $FILES
}


# manage records by use space
function manage_space()
{
	echo "to do manage_space ..." 
}


MNG_TYP=$1
manage_date 
archieve_video_files
