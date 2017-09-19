CC=cc
CFLAGS=-O3 -Wall -Wextra -fPIC
LDFLAGS=
LIBS=-lm -lpthread -lz
ZOPFLI=zopfli/src/zopfli/
# use gcc and gmake on Solaris

libpigz: pigz.o yarn.o try.o ${ZOPFLI}deflate.o ${ZOPFLI}blocksplitter.o ${ZOPFLI}tree.o ${ZOPFLI}lz77.o ${ZOPFLI}cache.o ${ZOPFLI}hash.o ${ZOPFLI}util.o ${ZOPFLI}squeeze.o ${ZOPFLI}katajainen.o
	$(CC) $(LDFLAGS) -shared -o libpigz.so $^ $(LIBS)

pigz.o: pigz.c yarn.h try.h ${ZOPFLI}deflate.h ${ZOPFLI}util.h

yarn.o: yarn.c yarn.h

try.o: try.c try.h

${ZOPFLI}deflate.o: ${ZOPFLI}deflate.c ${ZOPFLI}deflate.h ${ZOPFLI}blocksplitter.h ${ZOPFLI}lz77.h ${ZOPFLI}squeeze.h ${ZOPFLI}tree.h ${ZOPFLI}zopfli.h ${ZOPFLI}cache.h ${ZOPFLI}hash.h ${ZOPFLI}util.h

${ZOPFLI}blocksplitter.o: ${ZOPFLI}blocksplitter.c ${ZOPFLI}blocksplitter.h ${ZOPFLI}deflate.h ${ZOPFLI}lz77.h ${ZOPFLI}squeeze.h ${ZOPFLI}tree.h ${ZOPFLI}util.h ${ZOPFLI}zopfli.h ${ZOPFLI}cache.h ${ZOPFLI}hash.h

${ZOPFLI}tree.o: ${ZOPFLI}tree.c ${ZOPFLI}tree.h ${ZOPFLI}katajainen.h ${ZOPFLI}util.h

${ZOPFLI}lz77.o: ${ZOPFLI}lz77.h ${ZOPFLI}util.h ${ZOPFLI}cache.h ${ZOPFLI}hash.h ${ZOPFLI}zopfli.h

${ZOPFLI}cache.o: ${ZOPFLI}cache.c ${ZOPFLI}cache.h ${ZOPFLI}util.h

${ZOPFLI}hash.o: ${ZOPFLI}hash.c ${ZOPFLI}hash.h ${ZOPFLI}util.h

${ZOPFLI}util.o: ${ZOPFLI}util.c ${ZOPFLI}util.h

${ZOPFLI}squeeze.o: ${ZOPFLI}squeeze.c ${ZOPFLI}squeeze.h ${ZOPFLI}blocksplitter.h ${ZOPFLI}deflate.h ${ZOPFLI}tree.h ${ZOPFLI}util.h ${ZOPFLI}zopfli.h ${ZOPFLI}lz77.h ${ZOPFLI}cache.h ${ZOPFLI}hash.h

${ZOPFLI}katajainen.o: ${ZOPFLI}katajainen.c ${ZOPFLI}katajainen.h

yarnt.o: yarn.c yarn.h
	$(CC) $(CFLAGS) -DDEBUG -g -c -o yarnt.o yarn.c

clean:
	@rm -f *.o ${ZOPFLI}*.o libpigz.so 
