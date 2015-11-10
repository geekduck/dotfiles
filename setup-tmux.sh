#!/bin/bash

ghq get tmux-plugins/tpm
mkdir -p $HOME/.tmux/plugins
ln -s $HOME/workspace/github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
