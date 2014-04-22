#!/usr/bin/env bash

##
# Read this symlink to determine the dotfiles directory
export DOTFILES_DIR="$(dirname $(dirname $(readlink $BASH_SOURCE)))"

##
# Use `mate` as the default EDITOR
export EDITOR="$(which mate) -w"

##
# PATH additions
PATH=$HOME/bin:$PATH
PATH=/usr/local/bin:$PATH
PATH=$PATH:$DOTFILES_DIR/bin
PATH=$PATH:/usr/local/sbin
PATH=$PATH:/usr/local/share/npm/bin

##
# Enable rbenv shims and completion
# NB when installing new rubies with rbenv, you may need to manually
# point to gcc like `CC=/usr/bin/gcc rbenv install 1.9.3-p194`
# https://github.com/sstephenson/ruby-build/issues/132#issuecomment-4220120
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

##
# Fix pkgconfig path for imagemagick
PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH"

##
# Enable git completion and prompt
source ~/.git-prompt.sh
source ~/.git-completion.bash

##
# Add the current branch to the prompt
PS1='[\u@$(ip) \W$(__git_ps1 " (%s)")]\$ '
