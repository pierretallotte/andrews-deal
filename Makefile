# 
#
# This file is copyrighted under the GNU Public License.
# See http://www.gnu.org/copyleft/gpl.html for further
# details.
#
# Makefile for "deal", a bridge hand generator.
#

TCL_DIR=/usr

CC=gcc
#DEBUG_FLAGS=-g -ansi -Wall 
#CPPFLAGS = -fno-rtti -g
DEBUG_FLAGS=-O3 -ansi -Wall 
CPPFLAGS = -fno-rtti -O3 -Winline -Wall

# Change TCL_INCL to point to the directory containing Tcl's
# include files
TCL_INCL=/usr/local

# Change TCL_LIB to point to the directory where you have a copy
# of libtcl.
# 
TCL_LIB=$(TCL_DIR)/lib

######
LDFLAGS=  -L$(TCL_LIB) -ltcl -lm




#
ADVISOR=

# Since strdup is not implemented on some Ultrix systems
# (and is not required by ANSI C) you might want to
# uncomment the following line:
#
# EXTRAS_OBJS= util.o
#
EXTRA_OBJS= 

# On system which don't have "random" and "srandom",
# you might have to use the horrible "rand" for random
# number generation
#
#EXTRA_CFLAGS = -Drandom=rand -Dsrandom=srand
#
#EXTRA_CFLAGS = 
#EXTRA_CFLAGS = -DUSE_RAND48

COMPILE.c= $(CC) $(CFLAGS) -c

CFLAGS= $(DEBUG_FLAGS) -I$(TCL_INCL) $(EXTRA_CFLAGS)


OBJS=random.o additive.o hand.o deal.o formats.o tcl_deal.o maindeal.o stat.o counttable.o \
	vector.o dist.o stringbox.o dealtypes.o keywords.o holdings.o tcl_dds.o dds.o $(EXTRA_OBJS) 
SRCS=additive.c hand.c deal.c formats.c tcl_deal.c dist.c vector.c stat.c counttable.c stringbox.c dealtypes.c holdings.c keywords.c maindeal.c random.c dds.cpp
SRCKIT=additive.c hand.c deal.c formats.c tcl_deal.c dist.c vector.c stat.c makecounttable.c stringbox.c dealtypes.c holdings.c keywords.c maindeal.c random.c tcl_dds.c dds.cpp
HFILES=deck.h deal.h tcl_incl.h vector.h stat.h tcl_dist.h dist.h formats.h additive.h stringbox.h dealtypes.h holdings.h keywords.h ansidecl.h dds.h ddsInterface.h
EXAMPLES= ex/*.tcl
BUILDFILES=Makefile Make.dep 
OTHERFILES=CHANGES LICENSE GPL input format lib deal.tcl docs

SOURCEKIT=$(SRCKIT) $(HFILES) $(EXAMPLES) $(BUILDFILES) $(OTHERFILES) $(EXTRAS)
BINKIT=$(EXAMPLES) $(OTHERFILES)
UUKIT=$(EXAMPLES) $(OTHERFILES) deal

deal: $(OBJS)
	g++ $(CFLAGS) $(OBJS) -o deal $(LDFLAGS)

deal.cgi:
	make clean
	make CFLAGS="$(CFLAGS) -DCGI"

ideal: $(OBJS)
	proof $(CC) $(CFLAGS) $(OBJS) -o ideal $(LDFLAGS)

vector.so: vector.c
	$(CC) -c $(CFLAGS) -PIC vector.c
	ld vector.o -o vector.so

dist.so: dist.c
	$(CC) -c $(CFLAGS) -PIC dist.c
	ld dist.o -o dist.so

stringbox.so: stringbox.c
	$(CC) -c $(CFLAGS) -PIC stringbox.c
	ld stringbox.o -o stringbox.so

ccenter:
	 #load $(CFLAGS) $(SRCS) $(LDFLAGS)

ccentero: $(OBJS)
	 #load -w $(CFLAGS) $(OBJS) $(LDFLAGS)

cov:
	$(MAKE) CC="covc"
	cat qccov_work/*.M > deal.M

expert:
	$(MAKE) CC="exbuild $(CC)"

rtc:
	$(MAKE) clean
	$(MAKE) CC="/s/latest/CenterLine/bin/ncc -rtc -Xa" DEBUG_FLAGS=-g deal

$(SRCS): deal.h

counttable.c: makecounttable
	./makecounttable > counttable.c

makecounttable: makecounttable.c
	$(CC) $(CFLAGS) makecounttable.c -o makecounttable $(LDFLAGS)

checkin:
	checkin.script $(SOURCEKIT)

checkout:
	co -u $(SOURCEKIT)

firstcheckin:
	ci $(SOURCEKIT)

shar:
	mv Make.dep Make.dep.saved
	touch Make.dep
	shar $(SOURCEKIT) >deal.shar
	mv Make.dep.saved Make.dep

KITNAME=deal
DEAL_VERSION=311
OLD_VERSION=308
RELEASE=$(KITNAME)$(DEAL_VERSION)
SRCDIR=$(RELEASE)
BINDIR=$(RELEASE)-bin
SRCZIP=$(SRCDIR).zip
EXEZIP=$(SRCDIR)exe.zip
DOCZIP=$(SRCDIR)doc.zip
SRCTAR=$(SRCDIR).tar
SRCGZIP=$(SRCTAR).gz
BINZIP=$(KITNAME)exe.zip
DMG=$(BINDIR).dmg
DIFFZIP=deal$(DEAL_VERSION)diff.zip
OLDZIP=../deal/deal$(OLD_VERSION).zip
OLDDIR=$(KITNAME)$(OLD_VERSION)

FTP=../ftp

allzip: zip xzip dzip gzip diffzip

CHANGES: docs/html/CHANGES.txt
	cp docs/html/CHANGES.txt CHANGES

zip: $(SRCZIP) 

dmg: $(DMG)

xzip: $(EXEZIP)

dzip: $(DOCZIP)

$(BINDIR): $(BINKIT) docs/html docs/graphics
	rm -rf $(BINDIR)
	mkdir $(BINDIR)
	/bin/ls -1d $(BINKIT) | xargs tar cf - | (cd $(BINDIR) ; tar xf -)
	find $(BINDIR) -name CVS -print | xargs /bin/rm -rf

$(SRCDIR): $(SOURCEKIT) docs/html docs/graphics
	mv Make.dep Make.dep.saved
	touch Make.dep
	rm -rf $(SRCDIR)
	mkdir $(SRCDIR)
	/bin/ls -1d $(SOURCEKIT) | xargs tar cf - | (cd $(SRCDIR) ; tar xf -)
	mv Make.dep.saved Make.dep

$(SRCZIP): $(SRCDIR)
	zip -r $(SRCZIP) $(SRCDIR) -x \*~ -x *CVS/\*

$(EXEZIP): $(SRCDIR)
	rm -f $(EXEZIP)
	zip -r $(EXEZIP) $(SRCDIR)/ex $(SRCDIR)/input $(SRCDIR)/format $(SRCDIR)/docs $(SRCDIR)/CHANGES $(SRCDIR)/LICENSE $(SRCDIR)/GPL $(SRCDIR)/lib $(SRCDIR)/deal.tcl -x \*~

$(DMG): $(BINDIR) deal
	cp deal $(BINDIR)/deal
	/bin/rm -rf dmg
	mkdir dmg
	cp -r $(BINDIR) dmg/$(SRCDIR)
	hdiutil create -srcfolder dmg $(DMG)

$(DOCZIP): $(SRCDIR)
	rm -f $(DOCZIP)
	zip -r $(DOCZIP) $(SRCDIR)/CHANGES $(SRCDIR)/LICENSE $(SRCDIR)/GPL $(SRCDIR)/docs -x \*~

gzip: $(SRCTAR).gz

$(SRCTAR).gz: $(SRCDIR)
	rm -f $(SRCTAR).gz
	tar cf $(SRCTAR) $(SRCDIR)
	gzip $(SRCTAR)

$(BINZIP): deal
	strip deal
	ls -1 $(UUKIT) | grep -v /RCS | xargs zip $(BINZIP)
	#zip $(BINZIP) $(UUKIT)

diffzip: $(DIFFZIP)

$(DIFFZIP): $(SRCZIP)
	rm -rf tempdir $(DIFFZIP)
	mkdir tempdir
	cd tempdir ; unzip ../$(SRCZIP) ; unzip ../$(OLDZIP)
	cd tempdir ; diff -r $(OLDDIR) $(SRCDIR) > ../diff.out || echo Done
	zip $(DIFFZIP) diff.out

tar:
	mv Make.dep Make.dep.saved
	touch Make.dep
	tar cvf deal.tar $(SOURCEKIT)
	mv Make.dep.saved Make.dep

test: ./deal
	./deal -I "line tests/input/sample.line" -i format/ddline 100 > test.out
	diff test.out tests/output/sample.ddline

ftp: $(SRCZIP)
	cp $(SRCZIP) $(FTP)

depends:
	$(CC) $(CFLAGS) -M *.c *.cpp >Make.dep

clean:
	rm -rf deal $(OBJS) $(SRCDIR) $(SRCZIP) $(SRCGZIP) $(DOCZIP) $(DMG) $(EXEZIP) $(BINDIR)

include Make.dep
