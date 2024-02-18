working_dir=$(pwd)

install_config () {
	# if config file exists in $HOME, delete it
	if [[ -L "$HOME/$1" ]] || [[ -f "$HOME/$1" ]]; then
		echo "Deleting $HOME/$1"
		rm "$HOME/$1"
	fi
	ln -s "$(pwd)/$2" "$HOME/$1"
	echo "installed $HOME/$1"
}

if [[ $working_dir == *'/dotfiles' ]]; then
	# Install .tmux.conf
	install_config '.tmux.conf' 'tmux.conf'

	# Install .bash_aliases
	install_config '.bash_aliases' 'bash_aliases'

	# Install .vimrc
	install_config '.vimrc' 'vimrc'

	# Install .Xmodmap
	install_config '.Xmodmap' 'Xmodmap'

	# Install .gitconfig
	install_config '.gitconfig' 'gitconfig'

	# Install i3 config
	install_config '.config/i3/config' 'i3_config'
else
	echo 'This script needs to be run with the repository as the working directory'
fi
