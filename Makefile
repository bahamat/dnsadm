DESTDIR=
PREFIX=/usr/local

# Being text files, no build is necessary. But `make` by itself should not
# install.
.PHONY: all
all: dnsadm dnsadm.1
dnsadm:
	@true
dnsadm.1:
	@true

.PHONY: install
install: dnsadm dnsadm.1
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@mkdir -p $(DESTDIR)$(PREFIX)/share/man/man1
	install dnsadm $(DESTDIR)$(PREFIX)/bin/dnsadm
	install dnsadm.1 $(DESTDIR)$(PREFIX)/share/man/man1/dnsadm.1
