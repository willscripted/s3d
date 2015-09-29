
current_dir=$(shell pwd)

install:
	$(current_dir)/scripts/install

uninstall:
	$(current_dir)/scripts/uninstall

.PHONY: install uninstall
