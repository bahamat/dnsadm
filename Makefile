DESTDIR=
PREFIX=/usr/local

dnsadm:
	@true

.PHONY: install
install: dnsadm
	install $< $(DESTDIR)$(PREFIX)/bin/$<
