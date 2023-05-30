#include <cstdlib>
#include <iostream>
#include "LeakyStack.h"
#include "LeakyStack.h"
#include "LeakyStackB.h"
using namespace std;

/**
 * Constructor with specified max capacity
 * (parameter is optional, so this also serves as default constructor)  
 *  @param the maximum capacity
 */
LeakyStackB::LeakyStackB(int cap) {
  // ...

}


/** Returns the number of objects in the stack.
 *  @return number of elements
 */
int LeakyStackB::size() const {
  return -1;    // Replace this as needed
}


/** Determines if the stack is currently empty.
 *  @return true if empty, false otherwise.
 */
bool LeakyStackB::empty() const {
  return true;  // Replace this as needed
}


/** Returns a const reference to the top object in the stack.
 *  Throws a runtime_error if the stack is empty.
 * @return reference to top element
 */
const string& LeakyStackB::top() const {
  // These lines are NOT correct, but they compile...
  string junk;   // declares a local variable
  return junk;   // returns reference to this local variable (a sure mistake!)
}


/** Inserts an object at the top of the stack. If the stack
 *  is already at capacity, the oldest element will be lost.
 *  @param the new element
 */
void LeakyStackB::push(const string& elem) {
  // ...
}


/** Removes the top object from the stack.
 *  Throws a runtime_error if the stack is empty.
 */
void LeakyStackB::pop() {
  // ...
}