CC=g++
CFLAGS=-g -Wall
LFLAGS=

DOBJS=decode.o BitStreams.o
EOBJS=encode.o BitStreams.o
VOBJS=BitStreams.o Viewer.o

# rule for building the executable
default:  decode

decode: $(DOBJS)
	$(CC) -o decode $(LFLAGS) $(DOBJS)

encode: $(EOBJS)
	$(CC) -o encode $(LFLAGS) $(EOBJS)

Viewer: $(VOBJS)
	$(CC) -o Viewer $(LFLAGS) $(VOBJS)

all:      Viewer decode encode

# list of file dependencies
decode.o:           decode.cpp BitStreams.h BinaryTree.h VariousExceptions.h 
encode.o:           encode.cpp BitStreams.h BinaryTree.h VariousExceptions.h PriorityQueue.h PriorityQueue.tcc
BitStreams.o:       BitStreams.h BitStreams.cpp
Viewer.o:           Viewer.cpp BitStreams.h

# the following rule is used to compile .cpp files to .o
.cpp.o:
	$(CC) $(CFLAGS) -c $<


# the following removes all .o files, but leaves the executable
clean:
	rm -f *.o
