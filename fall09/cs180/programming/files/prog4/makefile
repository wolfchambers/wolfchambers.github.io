CROSS=

CC=g++
CFLAGS=-g -Wall $(CROSS)
LFLAGS=$(CROSS)
OBJS=MergeTest.o Merger.o

all:  MergeTest

# rule for building the executable
MergeTest: $(OBJS)
	$(CC) -o MergeTest $(LFLAGS) $(OBJS)

# the following rule is used to compile .cpp files to .o
.cpp.o:
	$(CC) $(CFLAGS) -c $<


# the following removes all .o files, but leaves the executable
clean:
	rm -f *.o