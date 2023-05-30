#ifndef LEAKY_STACK_H
#define LEAKY_STACK_H

#include <string>

/**
 * Interface for a leaky stack: A collection of objects that are inserted
 * and removed according to the last-in first-out principle, but with
 * overflow handled by the removal of the least-recently accessed item.
 */
class LeakyStack {
 public:
  /** Returns the number of objects in the stack.
   *  @return number of elements
   */
  virtual int size() const =0;

  /** Determines if the stack is currently empty.
   *  @return true if empty, false otherwise.
   */
  virtual bool empty() const =0;

  /** Returns a const reference to the top object in the stack.
   *  Throws a runtime_error if the stack is empty.
   * @return reference to top element
   */
  virtual const std::string& top() const =0; 

  /** Inserts an object at the top of the stack. If the stack
   *  is already at capacity, the oldest element will be lost.
   *  @param the new element
   */
  virtual void push(const std::string& elem) =0; 

  /** Removes the top object from the stack.
   *  Throws a runtime_error if the stack is empty.
   */
  virtual void pop() =0;

  /** Virtual Destructor */
  virtual ~LeakyStack() {};
};


#endif