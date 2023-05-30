CROSS=

CC=g++
CFLAGS=-g -Wall $(CROSS)
LFLAGS=$(CROSS)
OBJS=TestAVL.o

all:  TestAVL

# rule for building the executable
TestBST: $(OBJS)
	$(CC) -o TestAVL $(LFLAGS) $(OBJS)

# redundant rules for other common "make ____" commands
# that might be typed by a student
BST: TestBST

# list of file dependencies
TestAVL.o: TestAVL.cpp AVLTree.h 

# the following rule is used to compile .cpp files to .o
.cpp.o:
	$(CC) $(CFLAGS) -c $<


# the following removes all .o files, but leaves the executable
clean:
	rm -f *.o
