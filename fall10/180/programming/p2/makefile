CROSS=

CC=g++
CFLAGS=-g -Wall $(CROSS)
LFLAGS=$(CROSS)
OBJS=WebHistoryDriver.o LeakyStackA.o LeakyStackB.o

# rule for building the executable
WebHistoryDriver: $(OBJS)
	$(CC) -o WebHistoryDriver $(OBJS) $(LFLAGS)

# redundant rules for other common "make ____" commands
# that might be typed by a student
all:  WebHistoryDriver
LeakyStack: WebHistoryDriver


# list of file dependencies
WebHistoryDriver.o: LeakyStack.h LeakyStackA.h LeakyStackB.h
LeakyStackA.o: LeakyStack.h LeakyStackA.h
LeakyStackB.o: LeakyStack.h LeakyStackB.h

# the following rule is used to compile .cpp files to .o
.cpp.o:
	$(CC) $(CFLAGS) -c $<


# the following removes all .o files, but leaves the executable
clean:
	rm -f *.o