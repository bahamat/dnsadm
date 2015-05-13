DESTDIR=
PREFIX=/usr/local

dnsadm:
	@true

.PHONY: install
install: dnsadm
	install dnsadm $(DESTDIR)$(PREFIX)/bin/dnsadm
