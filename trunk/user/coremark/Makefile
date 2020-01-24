SRC_NAME = coremark-master
SRC_URL = https://github.com/eembc/coremark/archive/master.zip
THISDIR = $(shell pwd)

all: download_test extract_test
	$(MAKE) -C $(SRC_NAME) XCFLAGS="-DMULTITHREAD=8 -DUSE_PTHREAD" PORT_DIR=linux LFLAGS_END="-lpthread -lrt" compile

download_test:
	( if [ ! -f $(THISDIR)/$(SRC_NAME).zip ]; then \
		wget -t5 --timeout=20 --no-check-certificate -O $(SRC_NAME).zip $(SRC_URL); \
	fi )

extract_test:
	( if [ ! -d $(SRC_NAME) ]; then \
		unzip -qq $(SRC_NAME).zip ; \
#		sed -i 's#CC = gcc##' $(SRC_NAME)/linux/core_portme.mak ; \
	fi )

clean:
	if [ -f $(SRC_NAME)/Makefile ] ; then \
		$(MAKE) -C $(SRC_NAME) PORT_DIR=linux clean ; \
	fi ;
	rm -f wget-log
	rm -f $(SRC_NAME).zip
	rm -rf $(SRC_NAME)

romfs:
	$(ROMFSINST) -p +x $(THISDIR)/$(SRC_NAME)/coremark.exe /usr/bin/coremark
