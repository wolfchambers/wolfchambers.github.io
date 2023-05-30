#include <iostream>
#include <stdexcept>
using namespace std;

/**
 * Array-Based Stack Interface
 **/

template <typename T>
class ArrayStack {
  
private:
  int _size;  //index to the top of the stack
  int _capacity;  //maximum size of the stack
  T* S;   //Pointer to array holding our stack
  
public:
  
  /** Standard constructor creates an empty stack with given capacity. */
  ArrayStack(int cap = 10) {
    _size = 0;
    _capacity = cap;
    S = new T[_capacity];
  }
  

  int size() const {
    return _size;
  }
  
  /** Returns the number of objects in the stack.  
   *  Return: number of elements 
   */ 
  bool empty() const {
    return (_size == 0);
  }
  
  /** Inserts an object at the top of the stack. 
   *  Input: the new element 
   */ 
  void push(const T& e) {
    if (_size == _capacity)
      throw domain_error("Stack is full");
    
    S[_size] = e;
    _size++;    
  }
  
  /** Removes the top object from the stack. */ 
  void pop() {
    if (_size == 0)
      throw domain_error("Stack is already empty");
    
    _size--;
    
  }

  /** Returns a const reference to the top object in the stack. 
   * Return: reference to top element 
   */   
  const T& top() const {
    if (empty())
      throw domain_error("Cannot get data from an empty stack");
    
    return S[_size-1];
  }

  /** Housekeeping Functions */
  
  //Copy constructor
  ArrayStack(const ArrayStack& other) {
    _size = other._size;
    _capacity = other._capacity;
    
    S = new T[_capacity];
    
    for (int i = 0; i < _size; i++)
      S[i] = other.S[i];
    
  }

  //Destructor 
  ~ArrayStack() {
    delete[] S;
  }
  
  //Operator=
  ArrayStack& operator=(const ArrayStack& other) {
    if (this != &other) {
      _size = other._size;
      _capacity = other._capacity;
    
      delete [] S;
      S = new T[_capacity];
    
      for (int i = 0; i < _size; i++)
	S[i] = other.S[i];
      
      
    }
    return *this;
  }
  

};
