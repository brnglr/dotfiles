working_dir=$(pwd)
if [[ $working_dir == *'/dotfiles' ]]; then
	# Install .tmux.conf
	if [[ -L "$HOME/.tmux.conf" ]] || [[ -f "$HOME/.tmux.conf" ]]; then
		echo "Deleting $HOME/.tmux.conf"
		rm "$HOME/.tmux.conf"
	fi
	ln -s "$(pwd)/tmux.conf" "$HOME/.tmux.conf"
	echo "installed $HOME/.tmux.conf"

	# Install .bash_aliases
	if [[ -L "$HOME/.bash_aliases" ]] || [[ -f "$HOME/.bash_aliases" ]]; then
		echo '.bash_aliases already exists, skipping .bash_aliases installation'
	else
		ln -s "$(pwd)/bash_aliases" "$HOME/.bash_aliases"
		echo "installed $HOME/.bash_aliases"
	fi

	# Install .vimrc
	if [[ -L "$HOME/.vimrc" ]] || [[ -f "$HOME/.vimrc" ]]; then
		echo '.vimrc already exists, skipping .vimrc installation'
	else
		ln -s "$(pwd)/vimrc" "$HOME/.vimrc"
		echo "installed $HOME/.vimrc"
	fi

	# Install .Xmodmap
	if [[ -L "$HOME/.Xmodmap" ]] || [[ -f "$HOME/.Xmodmap" ]]; then
		echo '.Xmodmap already exists, skipping .Xmodmap installation'
	else
		ln -s "$(pwd)/Xmodmap" "$HOME/.Xmodmap"
		echo "installed $HOME/.Xmodmap"
	fi

	# Install .gitconfig
	if [[ -L "$HOME/.gitconfig" ]] || [[ -f "$HOME/.gitconfig" ]]; then
		echo '.gitconfig already exists, skipping .gitconfig installation'
	else
		ln -s "$(pwd)/gitconfig" "$HOME/.gitconfig"
		echo "installed $HOME/.gitconfig"
	fi

else
	echo 'This script needs to be run with the repository as the working directory'
fi
