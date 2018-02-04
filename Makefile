DESTDIR=
PREFIX=/usr/local

.PHONY: all install clean test

# Being text files, no build is necessary. But `make` by itself should not
# install.
all: dnsadm dnsadm.1
dnsadm:
	@true
dnsadm.1:
	@true

install: dnsadm dnsadm.1
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@mkdir -p $(DESTDIR)$(PREFIX)/share/man/man1
	cp dnsadm $(DESTDIR)$(PREFIX)/bin/dnsadm
	cp dnsadm.1 $(DESTDIR)$(PREFIX)/share/man/man1/dnsadm.1

uninstall:
	rm $(DESTDIR)$(PREFIX)/bin/dnsadm
	rm $(DESTDIR)$(PREFIX)/share/man/man1/dnsadm.1

clean:
	@true

test:
	echo $(MAKESYSPATH)
	@true
