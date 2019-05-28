#!/usr/bin/env make

install: dots osx
uninstall: cleandots

# ============
# = DOTFILES =
# ============

SRCS = $(wildcard src/.[!.]*)
DOTS = $(SRCS:src/%=~/%)

dots: $(DOTS)

~/%: src/%
	ln -s $(PWD)/$< $@

cleandots:
	rm -f $(DOTS)

# ============
# = SSH KEYS =
# ============

~/.ssh/id_rsa.pub:
	read email
	ssh-keygen -t rsa -b 4096 -C "$(email)"
	ssh-add ~/.ssh/id_rsa
	pbcopy < $@

ssh: ~/.ssh/id_rsa.pub
	open https://github.com/settings/ssh

# ================
# = OSX SETTINGS =
# ================

osx:
	sudo -v
	sudo scutil --set ComputerName "$(USER)"
	sudo scutil --set HostName "$(USER)"
	sudo scutil --set LocalHostName "$(USER)"
	sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$(USER)"
