#!/bin/bash

set -eu

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

###############################
# application-specific
IMAGE_NAME=atk-libsigrok
FILEPATH=/atk_libsigrokdecode/.libs/libsigrokdecode.a
###############################

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

docker build -t $IMAGE_NAME $SCRIPT_DIR

id=$(docker create $IMAGE_NAME)
docker cp $id:$FILEPATH `basename $FILEPATH`
docker rm -v $id