# To use this Makefile with your version of magic-cli, change the value of
# PREFIX to whatever you have renamed the main command to.
PREFIX = j

# Where to install the tools
DESTINATION_DIR = /usr/local/bin

# Files to install
FILES = \
	${PREFIX} \
	${PREFIX}-*

install: install_quiet announce_installation

announce_installation:
	@echo "OK, ${PREFIX} command line tools have been installed. 🎉\n" && ${PREFIX}

install_quiet:
	@install -m 755 -p $(FILES) ${DESTINATION_DIR}

uninstall:
	sh -c "cd ${DESTINATION_DIR} && rm ${PREFIX} && rm ${PREFIX}-*"
