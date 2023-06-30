#!/bin/bash
set -m

gobgpd -f $GOBGPD_CONFIG &

sleep 1

if [ -z "$MRT_FILE" ]
then
  echo "\$MRT_FILE is not set"
else
  COMMAND="gobgp mrt inject global $MRT_FILE"

  if [ -z "$PREFIX_LIMIT" ]
  then
    echo "\$PREFIX_LIMIT is not set"
  else
    COMMAND="$COMMAND $PREFIX_LIMIT"
  fi

  if [ -z "$INJECT_OPTION" ]
  then
    echo "\$INJECT_OPTION is not set"
  else
    COMMAND="$COMMAND $INJECT_OPTION"
  fi
 
  eval $COMMAND

fi

gobgp completion bash > /usr/share/bash-completion/completions/gobgp

echo ". /etc/bash_completion" >> ~/.bashrc

fg %1
