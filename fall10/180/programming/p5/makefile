CROSS=

CC=g++
CFLAGS=-g -Wall $(CROSS)
LFLAGS=$(CROSS)
OBJS=TestAVLTree.o

all:  TestAVLTree

# rule for building the executable
TestAVLTree: $(OBJS)
	$(CC) -o TestAVLTree $(LFLAGS) $(OBJS)

# redundant rules for other common "make ____" commands
# that might be typed by a student
AVLTree: TestAVLTree

# list of file dependencies
TestAVLTree.o: TestAVLTree.cpp AVLTree.h

# the following rule is used to compile .cpp files to .o
.cpp.o:
	$(CC) $(CFLAGS) -c $<


# the following removes all .o files, but leaves the executable
clean:
	rm -f *.o