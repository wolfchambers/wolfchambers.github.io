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
  
  SlinkedList<Object> _S;
  int _size;
  
public:
  
  LinkedStack();
  
  int size() const;
  
  bool empty() const;
  
  const Object& top() const;
  
  void push(const Object& elem);
  
  void pop();
  
  //Housekeeping Functions
  
  LinkedStack(const LinkedStack& other);

  LinkedStack operator=(const LinkedStack& other);

  ~LinkedStack();
  
}; //end of Linked Stack interface

#endif
