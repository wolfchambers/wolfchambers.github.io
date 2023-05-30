CROSS=

CC=g++
CFLAGS=-g -Wall $(CROSS)
LFLAGS=$(CROSS)
OBJS=test_smart_stack.o

all:  test_smart_stack

# rule for building the executable
test_smart_stack: $(OBJS)
	$(CC) -o test_smart_stack $(LFLAGS) $(OBJS)

# redundant rules for other common "make ____" commands
# that might be typed by a student
SmartStack: test_smart_stack

# list of file dependencies
test_smart_stack.o: test_smart_stack.cpp smart_stack.h

# the following rule is used to compile .cpp files to .o
.cpp.o:
	$(CC) $(CFLAGS) -c $<


# the following removes all .o files, but leaves the executable
clean:
	rm -f *.o
