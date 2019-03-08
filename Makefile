ifndef DEBUG
# Default: compile for debug
DEBUG=1
endif
#PROFILE=1

CC = gcc

BASICFLAGS= -std=c11

DEBUGFLAGS=  -g 
OPTFLAGS= -g -finline -march=native -O3 -DNDEBUG

ifeq ($(PROFILE),1)
PROFFLAGS= -g -pg 
PLFLAGS= -g -pg
else
PROFFLAGS= 
PLFLAGS=
endif

INCLUDE_PATH=-I. 

CFLAGS= -Wall -D_GNU_SOURCE $(BASICFLAGS)

ifeq ($(DEBUG),1)
CFLAGS+=  $(DEBUGFLAGS) $(PROFFLAGS) $(INCLUDE_PATH)
else
CFLAGS+=  $(OPTFLAGS) $(PROFFLAGS) $(INCLUDE_PATH)
endif

LDFLAGS= $(PLFLAGS) $(BASICFLAGS)
LIBS=-lfl
FLEX=flex
BISON=bison

#------------------------------------------
# app
#------------------------------------------


C_PROG= ptucc ptucc_scan sample001
C_SOURCES= ptucc.c ptucc_scan.c cgen.c
C_GEN=ptucc_lex.c ptucc_parser.tab.h ptucc_parser.tab.c sample001.c

C_SRC= $(C_SOURCES) $(C_GEN)

C_OBJECTS=$(C_SRC:.c=.o)

.PHONY: all tests release clean distclean

all: ptucc_scan ptucc

ptucc: ptucc.o ptucc_lex.o ptucc_parser.tab.o cgen.o
	$(CC) $(CFLAGS) -o $@ $+ $(LIBS)

ptucc_scan: ptucc_scan.o ptucc_lex.o ptucc_parser.tab.o cgen.o
	$(CC) $(CFLAGS) -o $@ $+ $(LIBS)

ptucc_lex.c: ptucc_lex.l ptucc_parser.tab.h
	$(FLEX) -o ptucc_lex.c ptucc_lex.l

ptucc_parser.tab.c ptucc_parser.tab.h: ptucc_parser.y
	$(BISON) -dvr all ptucc_parser.y

test: ptucc
	./ptucc < sample001.fl > sample001.c
	gcc -Wall -std=c99 -o sample001 sample001.c
	./sample001

# Custom Commands
lexer: ptucc_lex.l
	$(FLEX) ptucc_lex.l

syntact: ptucc_parser.y
	$(BISON) -dvr all ptucc_parser.y

compileCompliler:
	$(CC) -o ptucc lex.yy.c ptucc_parser.tab.c -lfl

compile:
	./ptucc < sample001.fl > sample001.c

helloWorld: ptucc_scan ptucc
	./ptucc < programs/hello_world.fl > programs/build/hello_world.c
	gcc -Wall -std=c99 -o programs/build/hello_world programs/build/hello_world.c
	./programs/build/hello_world

useless: ptucc_scan ptucc
	./ptucc < programs/useless.fl > programs/build/useless.c
	gcc -Wall -std=c99 -o programs/build/useless programs/build/useless.c
	./programs/build/useless

calculate: ptucc_scan ptucc
	./ptucc < programs/calculate.fl > programs/build/calculate.c
	gcc -Wall -std=c99 -o programs/build/calculate programs/build/calculate.c
	./programs/build/calculate

sample000: ptucc_scan ptucc
	./ptucc < programs/sample000.fl > programs/build/sample000.c
	gcc -Wall -std=c99 -o programs/build/sample000 programs/build/sample000.c
	./programs/build/sample000

sample001: ptucc_scan ptucc
	./ptucc < programs/sample001.fl > programs/build/sample001.c
	gcc -Wall -std=c99 -o programs/build/sample001 programs/build/sample001.c
	./programs/build/sample001

sample002: ptucc_scan ptucc
	./ptucc < programs/sample002.fl > programs/build/sample002.c
	gcc -Wall -std=c99 -o programs/build/sample002 programs/build/sample002.c
	./programs/build/sample002

sample003: ptucc_scan ptucc
	./ptucc < programs/sample003.fl > programs/build/sample003.c
	gcc -Wall -std=c99 -o programs/build/sample003 programs/build/sample003.c
	./programs/build/sample003

sample004: ptucc_scan ptucc
	./ptucc < programs/sample004.fl > programs/build/sample004.c
	gcc -Wall -std=c99 -o programs/build/sample004 programs/build/sample004.c
	./programs/build/sample004

sample005: ptucc_scan ptucc
	./ptucc < programs/sample005.fl > programs/build/sample005.c
	gcc -Wall -std=c99 -o programs/build/sample005 programs/build/sample005.c
	./programs/build/sample005

sample006: ptucc_scan ptucc
	./ptucc < programs/sample004.fl > programs/build/sample006.c
	gcc -Wall -std=c99 -o programs/build/sample006 programs/build/sample006.c
	./programs/build/sample006

bad001: ptucc_scan ptucc
	./ptucc < programs/bad001.fl > programs/build/bad001.c
	gcc -Wall -std=c99 -o programs/build/bad001 programs/build/bad001.c
	./programs/build/bad001

bad002: ptucc_scan ptucc
	./ptucc < programs/bad002.fl > programs/build/bad002.c
	gcc -Wall -std=c99 -o programs/build/bad002 programs/build/bad002.c
	./programs/build/bad002

bad003: ptucc_scan ptucc
	./ptucc < programs/bad003.fl > programs/build/bad003.c
	gcc -Wall -std=c99 -o programs/build/bad003 programs/build/bad003.c
	./programs/build/bad003

bad004: ptucc_scan ptucc
	./ptucc < programs/bad004.fl > programs/build/bad004.c
	gcc -Wall -std=c99 -o programs/build/bad004 programs/build/bad004.c
	./programs/build/bad004

bad005: ptucc_scan ptucc
	./ptucc < programs/bad005.fl > programs/build/bad005.c
	gcc -Wall -std=c99 -o programs/build/bad005 programs/build/bad005.c
	./programs/build/bad005

correct1: ptucc_scan ptucc
	./ptucc < programs/correct1.fl > programs/build/correct1.c
	gcc -Wall -std=c99 -o programs/build/correct1 programs/build/correct1.c
	./programs/build/correct1

correct2: ptucc_scan ptucc
	./ptucc < programs/correct2.fl > programs/build/correct2.c
	gcc -Wall -std=c99 -o programs/build/correct2 programs/build/correct2.c
	./programs/build/correct2

wrong1: ptucc_scan ptucc
	./ptucc < programs/wrong1.fl > programs/build/wrong1.c
	gcc -Wall -std=c99 -o programs/build/wrong1 programs/build/wrong1.c
	./programs/build/wrong1

wrong2: ptucc_scan ptucc
	./ptucc < programs/wrong2.fl > programs/build/wrong2.c
	gcc -Wall -std=c99 -o programs/build/wrong2 programs/build/wrong2.c
	./programs/build/wrong2

#-----------------------------------------------------
# Build control
#-----------------------------------------------------

distclean: realclean
	-touch .depend
	-rm *~

realclean:
	-rm $(C_PROG) $(C_OBJECTS) $(C_GEN) .depend *.o sample001.c sample001
	-rm .depend
	-rm lex.yy.c
	-rm ptucc_parser.output
	-touch .depend
	-rm programs/build/*
	-cp ptuclib.h programs/build/ptuclib.h

depend: $(C_SOURCES)
	$(CC) $(CFLAGS) -MM $(C_SOURCES) > .depend
	
clean: realclean depend

include .depend

# Create release (courses handout) archive

release: clean-release-files tinyos2.tgz

clean-release-files:
	-rm tinyos2.tgz

TARFILES= cgen.c	cgen.h	Makefile  ptucc.c  ptucc_lex.l	\
  ptucc_parser.y ptucc_scan.c  ptuclib.h  sample001.fl \
  README.txt


ptuc_example.tgz: $(TARFILES)
	$(MAKE) distclean
	tar czvhf ptuc_example.tgz $(TARFILES)