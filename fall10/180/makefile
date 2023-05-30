#
# Filename: Makefile for CreditCard
# Date created: Sept. 3, 2009
# Author: Tanya L. Crenshaw
#
# NOTE: Be sure to "TAB" after colon and to indent
# any other lines.
#

# Declare and set some variables to make it
# easier to make any global edits to the makefile later
# in life.  For example, you might want to use a different
# compiler.  If so, you can just change the CC variable
# once, instead of multiple times in the file.

# Compiler
CC = g++

# List of object files
OBJS = TestCard.o CreditCard.o

# Compile the executable from its list of dependent
# object files.  The '-o' option makes that happen.

# The executable's name is "prog1"
prog1:	$(OBJS)
	$(CC) -o prog1 $(OBJS)

# Compile target source files into their respective object files.  
# This allows you to compile each file individually without linking 
# each file. The '-c' option makes that happen.

# State object file's dependencies so that 
# all dependencies are compiled before the target source 
# file.
TestCard.o:	TestCard.cpp CreditCard.h
		$(CC) -c TestCard.cpp

CreditCard.o:	CreditCard.cpp CreditCard.h
		$(CC) -c CreditCard.cpp

# A clean rule allows you to do a 'make clean' when you want to
# remove the executable and all the object files and start compiling
# completely from scratch.  These are handy when grading student
# assignments.  Sometimes they can turn in other people's executables.
clean:
		-rm $(OBJS)
		-rm prog1

# This make file is the equivalent of executing the following
# three commands in sequence:

# g++ -c TestCard.cpp
# g++ -c CreditCard.cpp
# g++ -o prog1 TestCard.o CreditCard.o

# However, a makefile is convenient because the 'make' tool
# determines if a file has been edited since its last
# compiliation, and only compiles if necessary.  Years ago,
# that was a really neat feature since compiling took
# hours.  Now, it's just a nice convenience.

# To run the program after compilation, you can do the following:
#
# $ prog1
#
# However, if the '.' is not in your system path, you may need
# to invoke it this way:
#
# $ ./prog1
#
# I usually teach students both, since some may not know how to
# edit their bash settings to add '.' to the path. 