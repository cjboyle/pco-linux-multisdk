# Makefile for programs in this directory

PCODIR     = ../../pco_common/pco_include
CPCODIR    = ../../pco_common/pco_classes
PCOLIBDIR  = ../lib
CPCODIRUSB = ../pco_classes

CFLAGS += -O2 -Wall -DLINUX -I$(PCODIR) -I$(CPCODIR) -I$(CPCODIRUSB)
LFLAGS += -L$(PCOLIBDIR)

DISPLIB    = $(PCOLIBDIR)/libpcodisp.a
LOGLIB     = $(PCOLIBDIR)/libpcolog.a
FILELIB    = $(PCOLIBDIR)/libpcofile.a
REORDERLIB = $(PCOLIBDIR)/libreorderfunc.a
CAMLIB     = $(PCOLIBDIR)/libpcocam_usb.a

HEADERS = $(CPCODIR)/Cpco_com.h $(CPCODIRUSB)/VersionNo.h $(CPCODIRUSB)/Cpco_grab_usb.h $(CPCODIRUSB)/Cpco_com_usb.h

PCOLIB  = -lpcocam_usb  
#PCOLIB  = -lpcocam_usb -lpcolog  -lpcofile -lreorderfunc 
#PCOLIBX = -lpcocam_usb -lpcodisp -lpcofile -lreorderfunc

LIBADD  = -lusb-1.0 -lpthread -lrt -ldl
LIBADDX = -lusb-1.0 -lpthread -lrt -ldl -lX11 -lXext 



TARGETS = pco_camera_grab 


all:		$(TARGETS) copy

clean:
		$(RM) *~ $(TARGETS)  $(CPCODIR)/*~  *.log *.o

copy:	
		@mv $(TARGETS) ../bin

%.o:		%.cpp
		$(CXX) $(CFLAGS) -c $< -o $@

pco_%:		pco_%.cpp $(CAMLIB) $(HEADERS) 
		$(CXX) $(CFLAGS) $@.cpp -o $@ $(LFLAGS) $(PCOLIB) $(LIBADD)
		$(CXX) $(CFLAGS) -rdynamic -L../bindyn $@.cpp -o ../bindyn/$@ $(PCOLIB) $(LIBADD) 


#pcox_%:		pcox_%.cpp $(CAMLIB) $(HEADERS) 
#		$(CXX) $(CFLAGS) $@.cpp -o $@ $(LFLAGS) $(PCOLIBX) $(LIBADDX)
#		$(CXX) $(CFLAGS) -rdynamic -L../bindyn $@.cpp -o ../bindyn/$@  $(PCOLIBX) $(LIBADDX)

