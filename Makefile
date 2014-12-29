
PREFIX ?= /usr/local

install: bin/ryogoku
	@cp -p $< $(PREFIX)/$<

uninstall:
	rm -f $(PREFIX)/bin/ryogoku

.PHONY: install uninstall
