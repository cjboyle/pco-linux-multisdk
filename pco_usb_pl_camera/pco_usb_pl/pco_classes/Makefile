#Makefile for pco_com


VERSION = $(word 3,$(shell head ./VersionNo.h -n50 | awk '/VERSION/&&!/SUB/{print $2}'))
SUBVERSION = $(word 3,$(shell head ./VersionNo.h -n40 | awk '/SUBVERSION/{print $2}'))
SUBAGE = $(word 3,$(shell head ./VersionNo.h -n40 | awk '/SUBAGE/{print $2}'))

PCOHDIR = ../../pco_common/pco_include
#PCOLIBDIR = ../../pco_common/pco_lib
PCOLIBDIR = ../lib
CPCODIR = ../../pco_common/pco_classes

LIBUSB_HDIR = /usr/include/libusb-1.0
LIBUSB_LIBDIR = /usr/lib/x86_64-linux-gnu
LIBUSB_LIB = $(LIBUSB_LIBDIR)/libusb-1.0.a

HEADERS = ./VersionNo.h ./Cpco_com_usb.h $(CPCODIR)/Cpco_com.h $(CPCODIR)/Cpco_com_func.h $(CPCODIR)/Cpco_com_func_2.h

CFLAGS := -O2 -Wall -DLINUX -fPIC -I$(PCOHDIR) -I$(CPCODIR) -I$(LIBUSB_HDIR) 
#LFLAGS += -L$(PCOLIBDIR)


COM_OBJ =  Cpco_com.o Cpco_com_func.o Cpco_com_func_2.o Cpco_com_usb.o Cpcolog.o
GRAB_OBJ = Cpco_grab_usb.o file12.o

TARGETS= libpcocom_usb libpcocam_usb

all: $(TARGETS)

clean:
		$(RM) *.o *~ $(PCOHDIR)*~ $(addprefix $(PCOLIBDIR)*/,$(addsuffix *,$(TARGETS)))

copy:
		@mv $(LIB_COM) $(PCOLIBDIR)
		@mv $(LIB_CAM) $(PCOLIBDIR)


%.o:		%.cpp $(HEADERS)
		$(CXX) $(CFLAGS) -c $< -o $@

C%.o:		$(CPCODIR)/C%.cpp $(HEADERS)
		$(CXX) $(CFLAGS) -c $< -o $@


libpcocam_usb:	$(COM_OBJ) $(GRAB_OBJ) 
		$(LD) -r -s -L$(PCOLIBDIR) $^ -o $(PCOLIBDIR)/$@.a 
		$(CC) -shared -Wl,-soname,$@.so.$(VERSION) -Wl,-L$(PCOLIBDIR) \
		-o $(PCOLIBDIR)dyn/$@.so.$(VERSION).$(SUBVERSION).$(SUBAGE) $^ 


libpcocom_usb:	$(COM_OBJ) 
		$(LD) -r -s -L$(PCOLIBDIR) $^ -o $(PCOLIBDIR)/$@.a 
		$(CC) -shared -Wl,-soname,$@.so.$(VERSION) -Wl,-L$(PCOLIBDIR) \
		-o $(PCOLIBDIR)dyn/$@.so.$(VERSION).$(SUBVERSION).$(SUBAGE) $^ 


