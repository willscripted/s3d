
current_dir=$(shell pwd)

install:
	$(current_dir)/scripts/install.sh

uninstall:
	$(current_dir)/scripts/uninstall.sh

.PHONY: install uninstall
