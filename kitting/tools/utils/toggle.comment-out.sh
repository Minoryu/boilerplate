#!/bin/bash

LANGUAGE=$1
FILE_DIRECTORY=$2

# LANGUAGE='en_US.UTF-8'
# FILE_DIRECTORY='/etc/locale.gen'

NUM=$(grep $LANGUAGE -n $FILE_DIRECTORY | cut -d ":" -f 1)
STATUS_COMMENT_OUT=$(grep $LANGUAGE -n $FILE_DIRECTORY | cut -d ":" -f 2)

# echo $NUM
# echo ${STATUS_COMMENT_OUT:0:1}

echo "before: $(cat $FILE_DIRECTORY | grep $LANGUAGE)"

if [ ${STATUS_COMMENT_OUT:0:1} = "#" ]; then
    sed -i "$NUM s/# //g" $FILE_DIRECTORY
else
    sed -i "$NUM s/^/# /g" $FILE_DIRECTORY
fi

echo "after : $(cat $FILE_DIRECTORY | grep $LANGUAGE)"
