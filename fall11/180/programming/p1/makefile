CROSS=

CC=g++
CFLAGS=-g -Wall $(CROSS)
LFLAGS=$(CROSS)
OBJS=CreditCard.o Test_CreditCard.o

all: Test_CreditCard

Test_CreditCard: $(OBJS)
	$(CC) -o Test_CreditCard $(LFLAGS) $(OBJS)



# list of file dependencies
Test_CreditCard.o: CreditCard.h
CreditCard.o: CreditCard.h



# the following rule is used to compile .cpp files to .o
.cpp.o:
	$(CC) $(CFLAGS) -c $<


# the following removes all .o files, but leaves the executable
clean:
	rm -f *.o