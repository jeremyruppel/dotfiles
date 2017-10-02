#!/usr/bin/env bash

##
# Read this symlink to determine the dotfiles directory
export DOTFILES_DIR="$(dirname $(dirname $(readlink $BASH_SOURCE)))"

##
# PATH additions
PATH=$HOME/bin:$PATH
PATH=/usr/local/bin:$PATH
PATH=$PATH:$DOTFILES_DIR/bin
PATH=$PATH:/usr/local/sbin
PATH=$PATH:/usr/local/share/npm/bin

##
# Set the nvm dir and export the `nvm` function
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

##
# Use `mate` as the default EDITOR
if which mate > /dev/null; then export EDITOR="$(which mate) -w"; fi

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
source $(brew --prefix git)/etc/bash_completion.d/git-prompt.sh
source $(brew --prefix git)/etc/bash_completion.d/git-completion.bash

##
# Determines which color the node version should be in the PS1.
# By default it's green, but if there is a .nvmrc in the cwd
# and it doesn't match our current node version, change to red
__node_version_color () {
  local color="32m" # green

  if [[ -e .nvmrc && "$(cat .nvmrc)" != "$(node --version)" ]]; then
    color="31m" # red
  fi

  echo $color
}

##
# Add the current branch and node version to the prompt
PS1='[\[\033[36m\]●\[\033[m\]\[\033[35m\]●\[\033[33;1m\] \w$(__git_ps1 " (%s)")\[\033[m\] \[\033[$(__node_version_color)\]⬢ $(node --version)\[\033[m\]]\$ '

##
# Source other profiles
test -e ~/.bash_profile && source ~/.bash_profile
