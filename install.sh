#!/usr/bin/env bash

set -e

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
