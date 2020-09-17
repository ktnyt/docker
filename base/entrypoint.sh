#!/bin/bash

if [[ -z "$LOCAL_USER_ID" ]]; then
    echo "LOCAL_USER_ID is not specified. Exiting." 1>&2
    exit 1
fi

useradd -M --shell $SHELL -u $LOCAL_USER_ID -o -c "" $USER
gpasswd -a $USER sudo > /dev/null

if [ ! -d $HOME ]; then
    mkdir $HOME
fi
chown -R $USER $HOME
cd $HOME

exec /usr/sbin/gosu $USER "$@"