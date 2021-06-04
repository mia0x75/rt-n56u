SRC_NAME="libiconv-1.16"

all: extract_test config_test
	$(MAKE) -j$(HOST_NCPU) -C $(SRC_NAME)

extract_test:
        ( if [ ! -d $(SRC_NAME) ]; then \
                unzip -qq $(SRC_NAME).zip ; \
        fi )

config_test:
	( if [ -f ./config_done ]; then \
		echo "the same configuration"; \
	else \
		make configure && touch config_done; \
	fi )

configure:
	( cd $(SRC_NAME) ; \
	./configure \
		--prefix=$(STAGEDIR) \
		--enable-shared \
		--disable-static \
		--disable-debug-mode \
		--enable-relocatable \
		--disable-nls \
		--host=$(HOST_TARGET) \
		--build=$(HOST_BUILD); \
	)

clean:
	if [ -f $(SRC_NAME)/Makefile ] ; then \
		$(MAKE) -C $(SRC_NAME) clean ; \
	fi ; \
	rm -rf $(SRC_NAME)
	rm -f config_done

install:
	$(MAKE) -C $(SRC_NAME) install DESTDIR=""

romfs:
	cp -fP $(DESTDIR)/lib/libiconv.so* $(ROMFSDIR)/lib
	chmod +x $(ROMFSDIR)/lib/libiconv.so*
