#!/usr/bin/make -f 


prepare-dirs: 
	@echo " * [ Building directories ] "
	@mkdir -p $HOME/.config/kitty/
	@mkdir -p $HOME/.config/awesome


install : prepare-dirs

	@echo " * [ Emacs ] : Copiando config de Emacs"
	@cp Emacs/dot.emacs $HOME/.emacs

	@echo " * [ Kitty ] :  Copiando config de Kitty"
	@cp Kitty/kitty.conf $HOME/.config/kitty/

	@echo " * [ Bash ]  : Copiando config de Bash "
	@cp Bash/dot.bashrc $HOME/.bashrc

	@echo " * [ Awesome ] : Copiando config de Awesome "
	@cp Awesome/rc.lua $HOME/.config/awesome
