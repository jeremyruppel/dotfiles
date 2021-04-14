DOTS = $(addprefix ~/,.gitattributes .gitconfig .gitignore .taskrc .vimrc .zshrc)

~: $(DOTS)
clean: $(DOTS)

~/%: home/%
	@ln -sv $(PWD)/$< $@

~: ~/profile.rc
clean: ~/profile.rc

~/profile.rc: profile.rc
	@ln -sv $(PWD)/$< $@
	@echo
	@echo "Now go to Terminal > Preferences > Profiles > Shell and"
	@echo "within Startup:"
	@echo "      [x] Run command: . $@"
	@echo "      [x] Run inside shell"
	@echo

~: ~/.vim/pack

~/.vim/pack: vim/pack
	mkdir -p $@
	@# need to use @D here when symlinking entire dirs
	@ln -svF $(PWD)/$< $(@D)

cleanvim:
	rm -rf ~/.vim/pack

clean: cleanvim

oh-my-zsh:
	sh -c "$$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

clean:
	rm -rf $^

