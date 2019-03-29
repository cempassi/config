#!/bin/sh

git config --global user.name "Cedric M'PASSI"
git config --global  user.email "cempassi@student.42.fr"

if [ -a ~/.gitignore ]
then
	touch ~/.gitignore
else
	ln -s ~/.config/.gitignore ~/.gitignore
	git config --global core.excludesfile ~/.gitignore
fi
