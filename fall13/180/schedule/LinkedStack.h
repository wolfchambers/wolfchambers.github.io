#ifndef LINKED_STACK_H
#define LINKED_STACK_H

#include <stdexcept> 
#include "SLinkedList.h"
using namespace std;

/**
 * Linked Stack Interface
 **/

template <typename Object>
class LinkedStack {
  
private:
  
  SLinkedList<Object> _S;
  int _size;
  
public:
  
  /** Standard constructor creates an empty stack with given capacity. */
  LinkedStack();
  
  /** Returns the number of objects in the stack.  
  *  Return: number of elements 
  */ 
  int size() const;

  /** Test if stack is empty
  *  Return: boolean set to true if stack is empty
  */   
  bool empty() const;
  
  /** Returns a const reference to the top object in the stack. 
  * Return: reference to top element 
  */ 
  const Object& top() const;
  
  /** Inserts an object at the top of the stack. 
  *  Input: the new element 
  */   
  void push(const Object& elem);
  
  /** Removes the top object from the stack. */   
  void pop();
  
  //Housekeeping Functions
  //not needed, since using SLinkedList
  
}; //end of Linked Stack interface

#include "LinkedStack.tcc"
#endif
