SRC_NAME = smartdns
THISDIR = $(shell pwd)

all: config_test
	$(MAKE) -C $(SRC_NAME) CC=$(CONFIG_CROSS_COMPILER_ROOT)/bin/mipsel-linux-uclibc-gcc

config_test:
	( if [ -f ./config_done ]; then \
		echo "the same configuration"; \
	else \
		touch config_done; \
	fi )

clean:
	if [ -f $(SRC_NAME)/Makefile ] ; then \
		$(MAKE) -C $(SRC_NAME) clean ; \
	fi ; \
	rm -f config_done

romfs:
	upx --best $(THISDIR)/$(SRC_NAME)/smartdns
	$(ROMFSINST) -p +x $(THISDIR)/$(SRC_NAME)/smartdns /usr/bin/smartdns
	$(ROMFSINST) -p +x $(THISDIR)/smartdns.sh /usr/bin/smartdns.sh
	$(ROMFSINST) $(THISDIR)/blockad.conf /etc/smartdns.d/blockad.conf
	$(ROMFSINST) $(THISDIR)/address.conf /etc/smartdns.d/address.conf
	$(ROMFSINST) $(THISDIR)/blacklist.conf /etc/smartdns.d/blacklist.conf
	$(ROMFSINST) $(THISDIR)/whitelist.conf /etc/smartdns.d/whitelist.conf
	$(ROMFSINST) $(THISDIR)/custom.conf /etc/smartdns.d/custom.conf
