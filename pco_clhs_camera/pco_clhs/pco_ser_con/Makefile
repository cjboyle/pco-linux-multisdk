# Makefile for programs in this directory

PCODIR      = ../../pco_common/pco_include
PCOLIBDIR   = ../../pco_common/pco_lib
CPCODIR     = ../../pco_common/pco_classes
CPCODIRCLHS = ../pco_classes
PCOCLHSDIR  = ../pco_clhs_common

CFLAGS += -O2 -Wall -DLINUX -I$(PCODIR) -I$(CPCODIR) -I$(CPCODIRCLHS) -I$(PCOCLHSDIR) 
LFLAGS += -L$(PCOLIBDIR)

LOGLIB    = $(PCOLIBDIR)/libpcolog.a
PCOCOMLIB = $(PCOLIBDIR)/libpcocom_clhs.a
CAMLIB    = $(PCOLIBDIR)/libpcocam_clhs.a

HEADERS = $(CPCODIRCLHS)/VersionNo.h $(CPCODIR)/Cpco_com.h $(CPCODIRCLHS)/Cpco_com_clhs.h

PCOLIB  = -lpcolog  -lpcofile -lpcocom_clhs -lpcoclhs
PCOLIBX = -lpcodisp -lpcofile -lpcocom_clhs -lpcoclhs

LIBADD  = -lpthread -lrt -ldl
LIBADDX = -lpthread -lrt -ldl -lX11 -lXext


TARGETS = pco_ser_con pco_getversions pco_switch_edge


all:		$(TARGETS) copy

clean:
		$(RM)  *~ $(TARGETS) $(CPCODIR)/*~  *.log *.o

copy:
		@mv $(TARGETS) ../bin

%.o:		%.cpp
		$(CXX) $(CFLAGS) -c $< -o $@


pco_%:		pco_%.cpp $(PCOCOMLIB) $(HEADERS)
		$(CXX) $(CFLAGS) $@.cpp -o $@ $(LFLAGS) $(LIBADD) $(PCOLIB)
		$(CXX) $(CFLAGS) -rdynamic -L../bindyn $@.cpp -o ../bindyn/$@  $(LIBADD) $(PCOLIB)




