#!/bin/bash

IPC_NAME=$1
# manage records by date

function manage_date
{
#remove all the files in the last day. by day or by hours.
echo "manage the record files by date."

#DAY=`date +%d`
#DAY=`expr ${DAY} - 2`

#HOUR=`date +%H`

CUR_SEC=`date +%s`
OLD_SEC=`expr ${CUR_SEC} - 4000`
OLD_TIME=`date -d "@${OLD_SEC}" +%T`

echo $OLD_TIME

REC_PATH=/var/record/$IPC_NAME/

FILES=${REC_PATH}${IPC_NAME}_`date -d "@${OLD_SEC}" +%y%m%d_%H`_*.mkv

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

