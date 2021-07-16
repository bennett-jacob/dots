install_all: install_cli install_dotfiles

install_cli:
	@echo "Installing CLI..."
	cd cli && $(MAKE) install

install_dotfiles:
	@echo "Installing dotfiles..."
	./bin/install_oh_my_zsh
	./bin/install_vim_plug
	cp dotfiles/.* $HOME
