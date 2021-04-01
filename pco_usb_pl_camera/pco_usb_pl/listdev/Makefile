# Makefile for programs in this directory

CFLAGS += -O -Wall -DLINUX


TARGET = pco_listdev


all:            $(TARGET) copy

clean:
		$(RM)  *~ $(TARGET) *.log *.o
		
copy:	
		@mv $(TARGET) ../bin


%.o:		%.cpp
		$(CXX) $(CFLAGS) -c $< -o $@


pco_%:		pco_%.cpp $(HEADERS)
		$(CXX) $(CFLAGS) $< -o $@ $(LFLAGS) -lusb-1.0 -lpthread -lrt


