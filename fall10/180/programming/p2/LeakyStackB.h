#ifndef LEAKY_STACK_B_H
#define LEAKY_STACK_B_H

#include <string>
#include "LeakyStack.h"

class LeakyStackB : public LeakyStack {
 public:
  /**
   * Constructor with specified max capacity
   * (parameter is optional, so this also serves as default constructor)  
   *  @param the maximum capacity
   */
  LeakyStackB(int cap=10);

  /** Returns the number of objects in the stack.
   *  @return number of elements
   */
  int size() const;

  /** Determines if the stack is currently empty.
   *  @return true if empty, false otherwise.
   */
  bool empty() const;

  /** Returns a const reference to the top object in the stack.
   *  Throws a runtime_error if the stack is empty.
   * @return reference to top element
   */
  const std::string& top() const;

  /** Inserts an object at the top of the stack. If the stack
   *  is already at capacity, the oldest element will be lost.
   *  @param the new element
   */
  void push(const std::string& elem);

  /** Removes the top object from the stack.
   *  Throws a runtime_error if the stack is empty.
   */
  void pop();

 private:

  // Feel free to add whatever additional data or functions that you wish.


};

#endif