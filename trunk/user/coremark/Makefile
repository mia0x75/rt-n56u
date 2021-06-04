SRC_NAME = coremark
SRC_URL = https://github.com/eembc/coremark/archive/master.zip
THISDIR = $(shell pwd)

all: download_test extract_test
	$(MAKE) -C $(SRC_NAME) XCFLAGS="-DMULTITHREAD=8 -DUSE_PTHREAD" PORT_DIR=linux LFLAGS_END="-lpthread -lrt" compile

download_test:
	( if [ ! -f $(THISDIR)/$(SRC_NAME).zip ]; then \
		git clone https://github.com/eembc/coremark $(SRC_NAME); \
	fi )

extract_test:
	( if [ ! -d $(SRC_NAME) ]; then \
		echo "Extracting..."; \
#		sed -i 's#CC = gcc##' $(SRC_NAME)/linux/core_portme.mak ; \
	fi )

clean:
	if [ -f $(SRC_NAME)/Makefile ] ; then \
		$(MAKE) -C $(SRC_NAME) PORT_DIR=linux clean ; \
	fi ;
	rm -rf $(SRC_NAME)

romfs:
	$(ROMFSINST) -p +x $(THISDIR)/$(SRC_NAME)/coremark.exe /usr/bin/coremark
