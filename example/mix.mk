BIN_PATH=$(NERVES_SYSTEM)/host/bin

all: qmake make

qmake:
	$(BIN_PATH)/qmake

make:
	make

clean:
	make clean
