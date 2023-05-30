CC = g++
CFLAGS = -Wall -g

all:  testAVL testBST

# rule for building the executable
testBST: testBST.cpp BinaryTree.h.gch BinarySearchTree.h.gch
	$(CC) $(CFLAGS) -o testBST testBST.cpp 

testAVL: testAVL.cpp AVLTree.h.gch BinarySearchTree.h.gch BinaryTree.h.gch
	$(CC) $(CFLAGS) -o testAVL testAVL.cpp


# redundant rules for other common "make ____" commands
# that might be typed by a student
BST: testBST

AVL: testAVL

# list of file dependencies
BinarySearchTree.h.gch: BinaryTree.h.gch
	$(CC) BinaryTree.h
AVLTree.h.gch: BinaryTree.h.gch BinarySearchTree.h.gch
	$(CC) AVLTree.h
BinaryTree.h.gch: 
	$(CC) BinaryTree.h

# the following rule is used to compile .cpp files to .o
#.cpp.o:
#	$(CC) $(CFLAGS) -c $<


# the following removes all .h.gch files, but leaves the executable
clean:
	rm -f *.h.gch
