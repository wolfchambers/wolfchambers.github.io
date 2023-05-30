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
  
  LinkedStack();
  
  int size() const;
  
  bool empty() const;
  
  const Object& top() const;
  
  void push(const Object& elem);
  
  void pop();
  
  //Housekeeping Functions
  //not needed, since using SLinkedList
  
}; //end of Linked Stack interface

#include "LinkedStack.tcc"
#endif
