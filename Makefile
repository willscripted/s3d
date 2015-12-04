
current_dir=$(shell pwd)

test:
	rspec test/shared_test.rb

install:
	$(current_dir)/scripts/install

uninstall:
	$(current_dir)/scripts/uninstall

.PHONY: install uninstall test
