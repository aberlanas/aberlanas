#!/bin/bash

echo " * [ Emacs ] : Copiando config de Emacs"
cp Emacs/dot.emacs $HOME/.emacs

echo " * [ Kitty ] :  Copiando config de Kitty"
mkdir -p $HOME/.config/kitty/
cp Kitty/kitty.conf $HOME/.config/kitty/

echo " * [ Bash ]  : Copiando config de Bash "
cp Bash/dot.bashrc $HOME/.bashrc

echo " * [ Awesome ] : Copiando config de Awesome "
mkdir -p $HOME/.config/awesome
cp Awesome/rc.lua $HOME/.config/awesome

#echo " * [ SciTe ] Copiando config de Scite "
#echo "             -> Destino : $HOME/.SciTEUser.properties"
#cp Scite/SciTEUser.properties $HOME/.SciTEUser.properties

#echo "* [ Makefile ] : github-env -> $HOME/GitHub/Makefile"
#cp Makefiles/Makefile.github-env $HOME/GitHub/Makefile
