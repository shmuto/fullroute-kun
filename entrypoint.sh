#!/bin/bash
set -m

gobgpd -f $GOBGPD_CONFIG &


sleep 1

/gobgp/gobgp mrt inject global $MRT_FILE

fg %1
