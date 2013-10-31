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
