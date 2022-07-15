CC=gcc

.PHONY: openssl
openssl:
ifeq ($(wildcard $(PWD)/openssl),)
	git submodule update --init
endif

	pushd openssl && ./Configure --prefix=/usr/local/openssl --openssldir=/usr/local/openssl && $(MAKE)

makenicebit:
	$(CC) -o niceBit niceBit.c -lcrypto -lsecp256k1
