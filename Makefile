DOTS = .gitattributes .gitconfig .gitignore .taskrc .vimrc .zshrc

~: dots

dots: $(addprefix ${PWD}/home/,${DOTS})
	@ln -sfv $^ ~

clean: cleandots

cleandots:
	rm ${addprefix ~/,${DOTS}}

~: ~/.vim/pack

~/.vim/pack: vim/pack
	@mkdir -p $@
	@ln -svfF $(PWD)/$< $(@D)

~: ~/.vim/ftplugin

~/.vim/ftplugin: vim/ftplugin
	@mkdir -p $@
	@ln -svfF $(PWD)/$< $(@D)

cleanvim:
	rm ~/.vim/pack
	rm ~/.vim/ftplugin

clean: cleanvim

oh-my-zsh:
	sh -c "$$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

