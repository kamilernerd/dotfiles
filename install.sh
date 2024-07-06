#! /bin/bash
declare -a dirs=("nvim" "alacritty" "hypr" "waybar")

CONFIG_DIR=$HOME/.config

delete_current_configuration() {
	for i in "${dirs[@]}"
	do
		echo "Deleting $CONFIG_DIR/$i"
		rm -r "$CONFIG_DIR/$i"
	done

	echo "Deleting $HOME/.tmux.conf"
	rm $HOME/.tmux.conf
}

install_configuration() {
	for i in "${dirs[@]}"
	do
		echo "Installing $PWD/$i in path $CONFIG_DIR/$i"
		cp -r $PWD/$i $CONFIG_DIR/$i
	done

	echo "Installing wallpapers to $HOME/.local/share/backgrounds"
	mkdir -p $HOME/.local/share/backgrounds
	cp $PWD/wallpapers/* $HOME/.local/share/backgrounds

	echo "Installing .tmux.conf in path $HOME/.tmux.conf"
	cp $PWD/.tmux.conf $HOME/.tmux.conf
}

reinstall() {
	echo "Staring..."
	delete_current_configuration
	install_configuration
	echo "Done."
}

help() {
	echo "--- This script is only for NVIM and TMUX ---"
	echo "Usage: ./install.sh [install|remove|reinstall|help]"
	echo "  install   - Installs dotfiles"
	echo "  remove    - Uninstalls dotfiles"
	echo "  reinstall - Reinstalls dotfiles"
	echo "  help      - Shows this page"
}

for arg in "$@"
do
		case "${arg}" in
				install) install_configuration;;
				remove) delete_current_configuration;;
				reinstall) reinstall;;
				help) help;;
				*) echo "Invalid option: $arg" && help;;
		esac
done
