

BIN_PATH = /usr/bin
BINARIES = primer3_core ntdpal ntthal oligotm long_seq_tm_test
BUILD_PATH = build


default: build
	@true

install:
	install -d -m 0755 $(BIN_PATH)
	install -m 0755 build/* $(BIN_PATH)

uninstall:
	cd $(BIN_PATH) && rm -f $(BINARIES)

clean: 
	rm -f src/*.o src/*.a
	for cmd in $(BINARIES); do rm -f src/$$cmd; done

build: clean
	mkdir -p build
	cd src && make
	for cmd in $(BINARIES); do cp src/$$cmd build/; done
