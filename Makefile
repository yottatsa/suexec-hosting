CFLAGS = \
	$(shell pkg-config --cflags apr-1 ) \
	-I/usr/include/apache2 \
	-I/usr/include \
	-Wall \
	-DAP_SUEXEC_SKIP_DOC_ROOT_CHECK \
	-DAP_SUEXEC_EXEC_ROOT \
	-DAP_SUEXEC_RLIMIT_MEMORY_META=268435456 \
	-DAP_SUEXEC_RLIMIT_NPROC_SOFT=53 \
	-DAP_SUEXEC_RLIMIT_CPU_SOFT=330 \

all: suexec

suexec: suexec.o

suexec.c: suexec.h Makefile
	touch $@

clean:
	rm -f suexec *.o

install: suexec
	install -m ug=rx,o=,u+ws -g www-data -t $(DESTDIR)/usr/lib/apache2/ suexec

.PHONY: all clean install
