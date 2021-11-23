#!/usr/bin/make -f 


prepare-dirs: 
	@echo " * [ Building directories ] "
	@mkdir -p $HOME/.config/kitty/



install : prepare-dirs

	@echo " * [ Kitty ] :  Copiando config de Kitty"
	@cp Kitty/kitty.conf ~/.config/kitty/

	@echo " * [ Bash ]  : Copiando config de Bash "
	@cp Bash/dot.bashrc ~/.bashrc


