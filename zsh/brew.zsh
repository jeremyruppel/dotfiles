# Adds brew to $PATH and other env vars
# NB homebrew has a different install path for silicon
if [[ `uname -m` = 'arm64' ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  eval "$(/usr/local/bin/brew shellenv)"
fi
