#include "LinkedStack.h"

LinkedStack::LinkedStack() : _S(), _size(0) {}
  
int LinkedStack::size() const {
 return _size; 
}
  
bool LinkedStack::empty() const {
  return (_size == 0);
}
  
const Object& LinkedStack::top() const {
    return _S.front();
}

  
void LinkedStack::push(const Object& elem) {
  _size++;
  _S.addFront(elem);
}
  
void LinkedStack::pop() {
  _size--;
  _S.removeFront();
}
  
//Housekeeping Functions

LinkedStack::LinkedStack(const LinkedStack& other) {
  _size = other._size;
  _S = other._S;
}
    

LinkedStack LinkedStack::operator=(const LinkedStack& other) {
}

LinkedStack::~LinkedStack() {
}
  
  
