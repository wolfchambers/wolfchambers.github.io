#include <iostream>
#include "SLinkedList.h"
using namespace std;

/**
 * Linked Stack Interface
 **/
template <typename Object>
class LinkedStack {
  
private:
  int _size;
  SLinkedList<Object> S;
  
public:
  
  /** Standard constructor creates an empty stack. */
  LinkedStack() : _size(0) {}
  

  /** Inserts an object at the top of the stack. 
  *  Input: the new element 
  */ 
  void push(const Object& e) {
    S.addFront(e);
    _size++;
  }
  
  /** Removes the top object from the stack. */ 
  void pop() {
    S.removeFront();
    _size--;
  }
  
  /** Returns a const reference to the top object in the stack. 
  * Return: reference to top element 
  */ 
  const Object& top () {
    return S.front();
  }
  
  /** Test if stack is empty
  *  Return: boolean set to true if stack is empty
  */ 
  bool empty() {
    return S.empty();
  }

  /** Returns the number of objects in the stack.  
  *  Return: number of elements 
  */   
  int size() {
    return _size;
  }

  //Housekeeping Functions
  //not needed, since using SLinkedList
  
};
