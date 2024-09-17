#!/bin/bash
echo "You Should Fisrt Have ssh installed in source and destination"
echo "else process will fails"

SOURCE_DIR=$1
TARGET_DIR=$2
TARGET_IP=$3
USER=$4

rsync -avz $SOURCE_DIR $USER@$TARGET_IP:$TARGET_DIR 