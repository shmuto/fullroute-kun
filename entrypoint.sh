#!/bin/bash
set -m

gobgpd -f $GOBGPD_CONFIG &

sleep 1

if [ -z "$PREFIX_LIMIT" ]
then
  gobgp mrt inject global $MRT_FILE
else
  gobgp mrt inject global $MRT_FILE $PREFIX_LIMIT
fi

gobgp completion bash > /usr/share/bash-completion/completions/gobgp

echo ". /etc/bash_completion" >> ~/.bashrc

fg %1
