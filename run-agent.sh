#!/bin/bash  -xu

#set  -xu

ssh-agent | tee  .agent
eval  `cat  .agent`

#set  +xu

ssh-add  ~/.ssh/*.ecdsa

