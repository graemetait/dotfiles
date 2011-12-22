#!/bin/bash
dest="$HOME/.dotfiles"

if [ -d "$dest" ]; then
	echo "Existing installation at $dest"
	echo "Aborting."
	exit 1
fi

git clone git://github.com/burriko/dotfiles.git "$dest"

for file in bash_profile bash_prompt exports aliases functions; do
	if [ -e "$dest/.$file" ]; then
		if [ -e "$HOME/.$file" ]; then
			echo "$file already exists"
		else
			ln -s "$dest/.$file" "$HOME/.$file"
			[ -e "$HOME/.$file" ] && source "$HOME/.$file"
		fi
	fi
done