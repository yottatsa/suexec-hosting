CFLAGS = \
	$(shell pkg-config --cflags apr-1 ) \
	-I/usr/include/apache2 \
	-I/usr/include \
	-Wall

all: suexec

suexec: suexec.o

suexec.c: suexec.h Makefile
	touch $@

clean:
	rm -f suexec *.o

install: suexec
	install -m ug=rx,o=,u+ws -g www-data -t $(DESTDIR)/usr/lib/apache2/ suexec

.PHONY: all clean install
