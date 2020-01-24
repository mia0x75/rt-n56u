SRC_NAME = trojan
VERSION = 1.14.0
THISDIR = $(shell pwd)
TROJAN_DIR = $(SRC_NAME)-$(VERSION)
TROJAN_NAME = $(SRC_NAME)-$(VERSION)-linux-mipsel.tar.gz
TROJAN_URL = https://github.com/maskedeken/trojan-gfw/releases/download/$(VERSION)/$(TROJAN_NAME)

all: download_test extra_test
	@echo "trojan build done!"

download_test:
	( if [ ! -f $(TROJAN_NAME) ]; then \
		wget -t5 --timeout=20 --no-check-certificate -O $(TROJAN_NAME) $(TROJAN_URL); \
	fi )

extra_test:
	( if [ ! -f $(SRC_NAME) ]; then \
		tar xf $(TROJAN_NAME); \
	fi )

clean:

romfs:
	$(ROMFSINST) -p +x $(THISDIR)/trojan /usr/bin/trojan
