SRC_NAME := TunSafe
THISDIR := $(shell pwd)

all: extract_test
	$(MAKE) -C $(SRC_NAME)

extract_test:
	( if [ ! -d $(SRC_NAME) ]; then \
		git clone https://github.com/TunSafe/TunSafe; \
	fi )

clean:
	( if [ -f $(SRC_NAME)/Makefile ] ; then \
		$(MAKE) -C $(SRC_NAME) clean ; \
	fi )
	rm -rf $(SRC_NAME)

romfs:
	$(ROMFSINST) -p +x $(THISDIR)/$(SRC_NAME)/tunsafe /usr/bin/tunsafe

