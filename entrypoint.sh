#!/bin/bash
set -m

gobgpd -f $GOBGPD_CONFIG &

sleep 1

if [ -z "$PREFIX_LIMIT" ]
then
  /gobgp/gobgp mrt inject global $MRT_FILE $PREFIX_LIMIT
else
  /gobgp/gobgp mrt inject global $MRT_FILE
fi

fg %1
