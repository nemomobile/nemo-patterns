all:

install:
	/usr/bin/repomd-pattern-builder.py --patternxml --version=$(VERSION) --release=$(RELEASE) -p ./ -o $(DESTDIR)/usr/share/package-groups/
