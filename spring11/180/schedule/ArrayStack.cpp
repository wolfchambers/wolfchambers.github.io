#include "ArrayStack.h"
#include <stdexcept>
using namespace std;

  /** Standard constructor creates an empty stack with given capacity. */
  ArrayStack::ArrayStack(int cap = 1000) {
    _capacity = cap;
    _t = 0;
    _S = new Object[_capacity];
  }
  
    /** Returns the number of objects in the stack.  
   *  Return: number of elements 
   */ 
  int ArracyStack::size() const {
    return _t;
  }
  
    /** Returns a const reference to the top object in the stack. 
   * Return: reference to top element 
   */ 
  const Object& ArrayStack::top() const {
    if (_t==0)
      throw runtime_error("Access to empty stack");
    return _S[_t-1];
  }
  
    /** Returns a live reference to the top object in the stack. 
   * Return: reference to top element 
   */ 
  Object& ArrayStack::top() {
    if (_t==0)
      throw runtime_error("Access to empty stack");
    return _S[_t-1];
  }
  
  /** Inserts an object at the top of the stack. 
   *  Input: the new element 
   */ 
  void ArrayStack::push(const Object& elem) {
    if (_t == _capacity)
      throw runtime_error("Stack overflow");
   _S[_t] = elem;
   _t++;
  }
  
  /** 
   * Copy constructor 
   */
  ArrayStack::ArrayStack(const ArrayStack& other) {
    _t = other._t;
    _capacity = other._capcity;
    _S = new Object[_capacity];
    for (int i=0; i<_t; i++)
      _S[i] = other._S[i];
  }
  
  /**
   * Destructor
   */ 
  ArrayStack::~ArrayStack() {
    delete [] _S;
  }
  
  /**
   * Operator=
   */
   ArrayStack& ArrayStack::operator=(const ArrayStack& other) {
     
     if (this != &other) {
       _capacity = other._capacity;
       _t = other._t;
       delete [] _S;
       _S = new Object[_capacity];
       for (int i=0; i<_t; i++)
	 _S[i] = other._S[i];
    }
    return *this;
   }