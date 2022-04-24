#!/bin/bash  -xu

#set  -xu

# ディレクトリを確実に存在させて、パーミッションを設定する
agent_lnk='.agent'
agent_dir=$(dirname $(readlink -f ${agent_lnk}))
if [[ ! -d ${agent_dir} ]] ; then
    mkdir -p ${agent_dir}
fi
chmod 700 ${agent_dir}

flag_add=FALSE
if [[ ! -f ${agent_lnk} ]] ; then
    ssh-agent | tee .agent
    flag_add=TRUE
fi
chmod 600 ${agent_lnk}

eval  $(cat  ${agent_lnk})

#set  +xu

if [[ "x${flag_add}y" = 'xTRUEy' ]] ; then
    ssh-add  ~/.ssh/*.ecdsa
fi
