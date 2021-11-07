# Decent settings, use native processor features, unroll loops and
# use O3 optimization
CFLAGS = -O3 -funroll-loops -march=native

all: bin/vminer

bin/vminer: bin/main.o bin/sha256.o Makefile
	@mkdir -p bin
	gcc ${CFLAGS} -Wall -pedantic bin/main.o bin/sha256.o -o bin/vminer

bin/main.o: src/main.c Makefile
	@mkdir -p bin
	gcc  ${CFLAGS} -c -Wall -pedantic src/main.c -o bin/main.o

bin/sha256.o: src/sha256.c Makefile
	@mkdir -p bin
	gcc  ${CFLAGS} -c -Wall -pedantic src/sha256.c -o bin/sha256.o
