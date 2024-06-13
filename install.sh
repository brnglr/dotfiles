# Check for arguments
if [ -z "$1" ]; then
    echo "Please specify keyboard type. Options: apple, normal"
    exit
fi

keyboard_type=$1
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
    if [ "$keyboard_type" = 'apple' ]; then
        install_config '.Xmodmap' 'xmodmaps/apple'
    else
        install_config '.Xmodmap' 'xmodmaps/normal'
    fi

	# Install .gitconfig
	install_config '.gitconfig' 'gitconfig'

	# Install i3 config
	install_config '.config/i3/config' 'i3_config'

	# Install .xinitrc
	install_config '.xinitrc' 'xinitrc'

	# Install .Xresources
	install_config '.Xresources' 'Xresources'
else
	echo 'This script needs to be run with the repository as the working directory'
fi
