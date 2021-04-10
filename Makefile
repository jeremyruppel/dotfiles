DOTS = $(addprefix ~/,.gitattributes .gitconfig .gitignore .taskrc)

~: $(DOTS)
clean: $(DOTS)

~/%: home/%
	ln -s $(PWD)/$< $@

~: ~/profile.rc
clean: ~/profile.rc

~/profile.rc: profile.rc
	ln -s $(PWD)/$< $@
	@echo
	@echo "Now add this to ~/.bash_profile:"
	@echo "  . $@"
	@echo

clean: 
	rm -f $^

