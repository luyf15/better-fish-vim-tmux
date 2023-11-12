#!/usr/bin/env bash

set -euo

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
    echo "cp -u tmux.conf.mac ~/.tmux.conf"
    cp -u tmux.conf.mac ~/.tmux.conf
    echo "cp -u -r .vim* ~/"
    cp -u -r .vim* /Users/${USER}/workspace/github/tmp
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo "cp -u tmux.conf.linux ~/.tmux.conf"
    cp -u tmux.conf.linux ~/.tmux.conf
    echo "cp -f -u fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish"
    cp -f fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish
    echo "cp -r --parents -u .vim* ~/"
    cp -r -u .vim* ~
else
    echo "Other system, do nothing"
fi
