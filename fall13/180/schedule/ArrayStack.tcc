#include "ArrayStack.h"
#include <stdexcept>
using namespace std;

/** Standard constructor creates an empty stack with given capacity. */
template <typename Object>
ArrayStack<Object>::ArrayStack(int cap = 1000) {
  _cap = cap;
  _t = 0;
  _S = new Object[_cap];
}

template <typename Object>
bool ArrayStack<Object>::empty() const {
  return (_t == 0);
}

/** Returns a live reference to the top object in the stack. 
* Return: reference to top element 
*/ 
template <typename Object>
Object& ArrayStack<Object>::top() {
  if (empty())
    throw domain_error("Stack is empty");
  return _S[_t-1];
}

/** Returns a const reference to the top object in the stack. 
* Return: reference to top element 
*/ 
template <typename Object>
const Object& ArrayStack<Object>::top() const {
  if (empty())
    throw domain_error("Stack is empty");
  
  return _S[_t-1];
}

/** Inserts an object at the top of the stack. 
*  Input: the new element 
*/ 
template <typename Object>
void ArrayStack<Object>::push(const Object& elem) {
  //check if the array is full
  if (_t == _cap)
    throw domain_error("Stack is full");
  
  //if there is room, add to the top
  _S[_t] = elem;
  _t++;
}

/** Removes the top object from the stack. */ 
template <typename Object>
void ArrayStack<Object>::pop() {
  if (empty())
    throw domain_error("Can't pop from empty stack");
  
  _t--;

}

/** Returns the number of objects in the stack.  
*  Return: number of elements 
*/ 
template <typename Object>
int ArrayStack<Object>::size() const {
  return _t;

}

//Copy constructor
template <typename Object>
ArrayStack<Object>::ArrayStack(const ArrayStack& other) {
  _cap = other._cap;
  _t = other._t;
  _S = new Object[_cap];
  
  //loop to copy other's data over
  for (int i=0; i<_t; i++)
    _S[i] = other._S[i];
}

//Destructor 
template <typename Object>
ArrayStack<Object>::~ArrayStack() {
  delete[] _S;
}

//Operator=
template <typename Object>
ArrayStack<Object>& ArrayStack<Object>::operator=(const ArrayStack& other) {
  if (this != &other) {
    delete[] _S;
    _cap = other._cap;
    _t = other._t;
    _S = new Object[_cap];
  
    //loop to copy other's data over
    for (int i=0; i<_t; i++)
      _S[i] = other._S[i];
  }
  return *this;
}
