#!/usr/bin/env make

MAN = $(wildcard man/**/*.md)
DOT = $(shell find src -type f)

install: dots docs apps osx ssh
uninstall: cleandots cleandocs cleanapps

# ============
# = DOTFILES =
# ============

dots: ${DOT:src/%=~/%}

~/%: src/%
	ln -s ${PWD}/$< $@

cleandots:
	rm -f ${DOT:src/%=~/%}

# =============
# = MAN PAGES =
# =============

docs: ${MAN:.md=} ${MAN:.md=.html}

man/%.1: man/%.1.md
	ronn --roff --pipe $< > $@

man/%.1.html: man/%.1.md
	ronn --html --pipe $< > $@

cleandocs:
	rm -f man/**/*.1
	rm -f man/**/*.1.html

# ================
# = APPLICATIONS =
# ================

/usr/local/bin/brew:
	ruby -e "$$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

brew: /usr/local/bin/brew
	brew doctor

apps: brew
	brew install app/*.rb
	brew linkapps

cleanapps:
	brew unlinkapps

#
# RUBY
#

# FIXME right now this tries to install ruby no matter what
# Find a good way to detect if the proper ruby is already installed
# and then add this as a dependency to the ronn rule
ruby: brew
	brew install ruby-build
	brew install rbenv
	rbenv install 1.9.3-p194
	rbenv global 1.9.3-p194

ronn:
	gem install ronn
	rbenv rehash

#
# SSH KEYS
#

~/.ssh/id_rsa.pub:
	read email
	ssh-keygen -t rsa -C "$(email)"
	ssh-add ~/.ssh/id_rsa
	pbcopy < $@

ssh: ~/.ssh/id_rsa.pub
	open https://github.com/settings/ssh
	
# ================
# = OSX SETTINGS =
# ================

CPU=ruppel

osx:
	sudo -v
	sudo chown -R $(shell whoami) /usr/local
	sudo scutil --set ComputerName "${CPU}"
	sudo scutil --set HostName "${CPU}"
	sudo scutil --set LocalHostName "${CPU}"
	sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "${CPU}"
