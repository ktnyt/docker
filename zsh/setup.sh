#!/bin/sh

if [ ! -f $HOME/.zshrc ]; then
    cp /tmp/zshrc $HOME/.zshrc
fi