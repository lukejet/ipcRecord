#!/bin/bash


DURATION=$3
IPC_NAME=$1
FIX=mp4

if [ -z $DURATION ]; then
        DURATION=05
fi

# replace the ip and path(if nessary) with your own ipc camera.
RTSP_URI=$2

DATE=`date +%y%m%d_%H_%M_%S`
REC_PATH=/var/record/$IPC_NAME/
FILE_NAME=$REC_PATH${IPC_NAME}_$DATE.$FIX

mkdir -p $REC_PATH

echo $DATE
echo $FILE_NAME
echo ffmpeg -hide_banner -rtsp_transport tcp -t 00:$DURATION:00 -i $RTSP_URI -vcodec copy -acodec aac $FILE_NAME

nohup ffmpeg -hide_banner -t 00:$DURATION:00 -i $RTSP_URI -vcodec copy -acodec aac $FILE_NAME &


