#!/usr/bin/env bash

##
# Read this symlink to determine the dotfiles directory
export DOTFILES_DIR="$(dirname $(dirname $(readlink $BASH_SOURCE)))"

##
# Use `mate` as the default EDITOR
export EDITOR="$(which mate) -w"

##
# PATH additions
export PATH=$PATH:$DOTFILES_DIR/bin

##
# Enable git completion and prompt
source ~/.git-prompt.sh
source ~/.git-completion.bash

##
# Add the current branch to the prompt
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
