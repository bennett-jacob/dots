install:
	@echo "Installing dotfiles..."
	./bin/install_oh_my_zsh
	./bin/install_vim_plug
	cp dotfiles/.* $HOME
