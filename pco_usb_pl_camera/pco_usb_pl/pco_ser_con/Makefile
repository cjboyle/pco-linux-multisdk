# Makefile for programs in this directory

PCODIR     = ../../pco_common/pco_include
CPCODIR    = ../../pco_common/pco_classes
PCOLIBDIR  = ../lib
CPCODIRUSB = ../pco_classes


CFLAGS += -O2 -Wall -DLINUX -I$(PCODIR) -I$(CPCODIR) -I$(CPCODIRUSB)
LFLAGS += -L$(PCOLIBDIR)

HEADERS = $(CPCODIRUSB)/VersionNo.h $(CPCODIR)/Cpco_com.h $(CPCODIRUSB)/Cpco_com_usb.h

PCOLIB  = -lpcocom_usb
#PCOLIB  = -lpcocom_usb -lpcolog  -lpcofile 
#PCOLIBX = -lpcocom_usb -lpcodisp -lpcofile 

LIBADD =  -lusb-1.0 -lpthread -lrt
LIBADDX = -lusb-1.0 -lpthread -lrt -lX11 -lXext 

TARGETS = pco_ser_con pco_getversions pco_switch_edge


all:		$(TARGETS) copy

clean:
		$(RM)  *~ $(TARGETS) $(CPCODIR)/*~  *.log *.o

copy:
		@mv $(TARGETS) ../bin

%.o:		%.cpp
		$(CXX) $(CFLAGS) -c $< -o $@


pco_%:		pco_%.cpp $(PCOCOMLIB) $(HEADERS)
		$(CXX) $(CFLAGS) $@.cpp -o $@ $(LFLAGS) $(PCOLIB) $(LIBADD)
		$(CXX) $(CFLAGS) -rdynamic -L../bindyn $@.cpp -o ../bindyn/$@ $(PCOLIB) $(LIBADD) 



