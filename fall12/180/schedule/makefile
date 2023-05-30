CROSS=

CC=g++
CFLAGS=-g -Wall $(CROSS)
LFLAGS=$(CROSS)
OBJS=testSLL.o

# rule for building the executable
testSLL: $(OBJS)
	$(CC) -o testSLL $(OBJS) $(LFLAGS)

# redundant rules for other common "make ____" commands
# that might be typed by a student
all:  testSLL


# list of file dependencies
testSLL.o: SLinkedList.h 
SLinkedList.o: SLinkedList.h

# the following rule is used to compile .cpp files to .o
.cpp.o:
	$(CC) $(CFLAGS) -c $<


# the following removes all .o files, but leaves the executable
clean:
	rm -f *.o
