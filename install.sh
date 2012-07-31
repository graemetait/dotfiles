#!/bin/bash
dotfiles="$HOME/.dotfiles"

if [ -d "$dotfiles" ]; then
	echo "Existing installation at $dotfiles"
	echo "Aborting."
	exit 1
fi

git clone git@github.com:burriko/dotfiles.git "$dotfiles"

function symlink()
{
	local source=$1
	local dest=$2
	echo "Symlinking $dotfiles/$source to $HOME/$dest"
	if [ -e "$dotfiles/$source" ]; then
		if [ -e "$HOME/$dest" ]; then
			echo "$file already exists"
		else
			ln -s "$dotfiles/$source" "$HOME/$dest"
			[ -e "$HOME/$dest" ] && source "$HOME/$dest"
		fi
	fi
}

symlink "bash/bash_profile" ".bash_profile"