#include "ArrayStack.h"
#include <stdexcept>
using namespace std;

/** Standard constructor creates an empty stack with given capacity. */
template <typename Object>
ArrayStack<Object>::ArrayStack(int cap = 1000) {
  _capacity = cap;
  _t = 0;
  _S = new Object[_capacity];
}

/** Returns a live reference to the top object in the stack. 
* Return: reference to top element 
*/ 
template <typename Object>
Object& ArrayStack<Object>::top() {
  if (_t == 0)
    throw runtime_error("Access to empty stack");
  return _S[_t-1];
}

/** Returns a const reference to the top object in the stack. 
* Return: reference to top element 
*/ 
template <typename Object>
const Object& ArrayStack<Object>::top() const {
  if (_t == 0)
    throw runtime_error("Access to empty stack");
  return _S[_t-1];
}

/** Inserts an object at the top of the stack. 
*  Input: the new element 
*/ 
template <typename Object>
void ArrayStack<Object>::push(const Object& elem) {
  if (_t == _capacity)
    throw runtime_error("Stack overflow");
  _S[_t] = elem;
  _t++;
}

/** Removes the top object from the stack. */ 
template <typename Object>
void ArrayStack<Object>::pop() {
  if (_t == 0)
    throw runtime_error("Stack is empty already");
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
  _capacity = other._capacity;
  _t = other._t;
  
  //create our array
  _S = new Object[_capacity];
  
  //for loop to copy data
  for (int i = 0; i < _t; i++)
    _S[i] = other._S[i];
}

//Destructor 
template <typename Object>
ArrayStack<Object>::~ArrayStack() {
  delete _S; 
}

//Operator=
template <typename Object>
ArrayStack<Object>& ArrayStack<Object>::operator=(const ArrayStack& other) {
  if (this != &other) {
    _capacity = other._capacity;
    _t = other._t;
	
    delete[] _S;
    _S = new Object[_capacity];
    
    //for loop to copy data
    for (int i = 0; i < _t; i++)
      _S[i] = other._S[i];
  }
  return *this;
}
