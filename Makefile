#!/usr/bin/env make

MAN = $(wildcard man/**/*.md)
DOT = $(shell find src -type f)

install: dots docs apps
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
	ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

apps: /usr/local/bin/brew
	brew install app/*.rb
	brew linkapps

cleanapps:
	brew unlinkapps

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
