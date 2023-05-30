#include <cstdlib>
#include <iostream>
#include <stdexcept>
#include "LeakyStack.h"
#include "LeakyStackA.h"
using namespace std;

/**
 * Constructor with specified max capacity
 * (parameter is optional, so this also serves as default constructor)  
 *  @param the maximum capacity
 */
LeakyStackA::LeakyStackA(int cap) {
  // ...

}


/** Returns the number of objects in the stack.
 *  @return number of elements
 */
int LeakyStackA::size() const {
  return -1;    // Replace this as needed
}


/** Determines if the stack is currently empty.
 *  @return true if empty, false otherwise.
 */
bool LeakyStackA::empty() const {
  return true;  // Replace this as needed
}


/** Returns a const reference to the top object in the stack.
 *  Throws a runtime_error if the stack is empty.
 * @return reference to top element
 */
const string& LeakyStackA::top() const {
  // These lines are NOT correct, but they compile...
  string junk;   // declares a local variable
  return junk;   // returns reference to this local variable (a sure mistake!)
}


/** Inserts an object at the top of the stack. If the stack
 *  is already at capacity, the oldest element will be lost.
 *  @param the new element
 */
void LeakyStackA::push(const string& elem) {
  // ...
}


/** Removes the top object from the stack.
 *  Throws a runtime_error if the stack is empty.
 */
void LeakyStackA::pop() {
  // ...
}

