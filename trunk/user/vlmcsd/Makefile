THISDIR = $(shell pwd)
SRC_NAME = vlmcsd-svn1113
SRC_URL = https://github.com/hanwckf/rt-n56u/raw/master/trunk/user/vlmcsd/vlmcsd-svn1113.tar.gz

all: download_test extract_test
	$(MAKE) -C $(SRC_NAME) vlmcsd CC=$(CONFIG_CROSS_COMPILER_ROOT)/bin/mipsel-linux-uclibc-gcc
	
download_test: 
	( if [ ! -f $(THISDIR)/$(SRC_NAME).tar.gz ]; then \
		wget -t5 --timeout=20 --no-check-certificate -O $(SRC_NAME).tar.gz $(SRC_URL); \
	fi )

extract_test:
	( if [ ! -d $(THISDIR)/$(SRC_NAME) ]; then \
		tar xf $(SRC_NAME).tar.gz; \
	fi )

romfs:
	upx --best $(THISDIR)/$(SRC_NAME)/bin/vlmcsd
	$(ROMFSINST) -p +x $(THISDIR)/$(SRC_NAME)/bin/vlmcsd /usr/bin/vlmcsd
	$(ROMFSINST) -p +x $(THISDIR)/vlmcsd.sh /usr/bin/vlmcsd.sh

clean:
	if [ -f $(SRC_NAME)/Makefile ] ; then \
		$(MAKE) -C $(SRC_NAME) clean ; \
	fi ; \
	rm -f $(SRC_NAME).tar.gz
	rm -rf $(SRC_NAME)
	rm -f wget-log
