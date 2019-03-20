#!/bin/bash


DURATION=05
IPC_NAME=ipc42
FIX=mkv
RTSP_URI=rtsp://192.168.1.77:554/stream1

DATE=`date +%y%m%d_%H_%M_%S`
REC_PATH=/var/record/$IPC_NAME/
FILE_NAME=$REC_PATH${IPC_NAME}_$DATE.$FIX

mkdir -p $REC_PATH

echo $DATE
echo $FILE_NAME
echo ffmpeg -hide_banner -rtsp_transport tcp -t 00:$DURATION:00 -i $RTSP_URI -vcodec copy -acodec copy $FILE_NAME

ffmpeg -hide_banner -rtsp_transport tcp -t 00:$DURATION:00 -i $RTSP_URI -vcodec copy -acodec copy $FILE_NAME


