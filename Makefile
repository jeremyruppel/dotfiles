DOTS = .gitattributes .gitconfig .gitignore .taskrc .vimrc .zshrc

~: dots

dots: $(addprefix ${PWD}/home/,${DOTS})
	@ln -sfv $^ ~

clean: cleandots

cleandots:
	rm ${addprefix ~/,${DOTS}}

~: ~/.vim/pack

~/.vim/pack: vim/pack
	mkdir -p $@
	@ln -svF $(PWD)/$< $(@D)

cleanvim:
	rm ~/.vim/pack

clean: cleanvim

oh-my-zsh:
	sh -c "$$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

