# ============
# = DOTFILES =
# ============

DOTS = $(addprefix ~/,.gitattributes .gitconfig .gitignore .taskrc)

~: $(DOTS)

~/%: home/%
	ln -s $(PWD)/$< $@

clean: $(DOTS)
	rm -f $^

