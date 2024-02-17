working_dir=$(pwd)
if [[ $working_dir == *'/dotfiles' ]]; then
	# Install .tmux.conf
	if [[ -L "$HOME/.tmux.conf" ]]; then
		echo '.tmux.conf already exists, skipping .tmux.conf installation'
	else
		ln -s "$(pwd)/tmux.conf" "$HOME/.tmux.conf"
		echo 'installed .tmux.conf'
	fi

	# Install .bash_aliases
	if [[ -L "$HOME/.bash_aliases" ]]; then
		echo '.bash_aliases already exists, skipping .bash_aliases installation'
	else
		ln -s "$(pwd)/bash_aliases" "$HOME/.bash_aliases"
		echo 'installed .bash_aliases'
	fi

	# Install .vimrc
	if [[ -L "$HOME/.vimrc" ]]; then
		echo '.vimrc already exists, skipping .vimrc installation'
	else
		ln -s "$(pwd)/vimrc" "$HOME/.vimrc"
		echo 'installed .vimrc'
	fi

else
	echo 'This script needs to be run with the repository as the working directory'
fi
