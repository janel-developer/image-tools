#!/bin/bash

# Assumes exiftool is in the path
EXIFTOOL=`which exiftool`

if [ ! $EXIFTOOL ]; then
    echo "Couldn't find exiftool - please check your PATH"
    exit 1
fi
if [ $# -lt 2 ] || [ $1 == '-h' ]; then
    echo "addtag.sh <image> <comma-separated list of tags without spaces>"
    exit 0
fi

IMAGE=${1}
NEW_TAGS=${2}
EXISTING_TAGS=`${EXIFTOOL} -ImageDescription ${IMAGE} | awk -F':' '{print $2}'`
echo "new tags: ${NEW_TAGS}"
echo "existing tags: ${EXISTING_TAGS}"
TAGS=`echo "${EXISTING_TAGS},${NEW_TAGS}" | sed s'/,/ #/g' | sed s'/^[[:space:]]*//'`
TAGS=${TAGS##*( )}

echo "adding tags $TAGS to image $IMAGE"
${EXIFTOOL} -ImageDescription="${TAGS}" ${IMAGE}