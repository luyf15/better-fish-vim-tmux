#!/usr/bin/env bash

set -euxo

if [ "$(which fish)" == "" ]; then
    echo "No fish found!"
    exit 1
else
    fish="$(which fish)"
fi

if [ "$SHELL" != ${fish} ]; then
    echo "chsh $USER -s ${fish}"
    chsh $USER -s ${fish}
fi

if [ "$(uname)" == "Darwin" ]; then
    echo "cp tmux.conf.mac ~/.tmux.conf"
    cp tmux.conf.mac ~/.tmux.conf
    echo "cp -r .vim* ~/"
    cp -r .vim* /Users/lilong4/workspace/github/tmp
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo "cp tmux.conf.linux ~/.tmux.conf"
    cp tmux.conf.linux ~/.tmux.conf
    echo "cp fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish"
    cp fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish
    echo "cp -r .vim* ~/"
    cp -r .vim* ~
else
    echo "Other system, do nothing"
fi
