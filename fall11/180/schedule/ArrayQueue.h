#ifndef ARRAY_QUEUE_H
#define ARRAY_QUEUE_H

#include <iostream>
#include <stdexcept>
using namespace std;

template <typename Object>
class ArrayQueue {
  
private:
  
  /** Variable declaration **/
  int _capacity;
  int _front;
  int _back;
  int _size;
  Object* _Q;
  
public:
  
  ArrayQueue(int cap) : _capacity(cap), _front(0), _back(0), _size(0), _Q(new Object[_capacity]) {}
  
  int size() const {
    return _size;
  }
  
  bool empty() const {
   return (_size == 0); 
  }
  
  void push(const Object& elem) {
    if (_size == _capacity)
      throw runtime_error("Queue is full");
    _Q[_back] = elem;
    _size++;
    _back = (_back+1) % _capacity;
    
  }
  
  void pop() {
    
    if (_size == 0)
      throw runtime_error("Queue is empty");
    
    _front = (_front + 1) % _capacity;
    _size--;
  }
  
  const Object& top() {
    if (_size == 0)
      throw runtime_error("Queue is empty");
    
    return _Q[_front];
  }
  
  //Housekeeping!
  
  //destructor
  ~ArrayQueue() {
    delete _Q;
  }
  
  //write operator=
  ArrayStack& operator=(const ArrayQueue& other) {
    if (self != &other) {
      
    }
    return *self;
  }
  
  //copy constructor
  ArrayQueue(const ArrayQueue& other) {
    _capacity = other._capacity;
    _front = other._front;
    _back = other._back;
    _size = other._size;
    
    //make a deep copy!
    _Q = new Object[_capacity];
    
    if (_front < _back)
      for (int i = _front; i < _back; i++)
	_Q[i] = other._Q[i];
    else {
      for (int i = _front; i < _capacity; i++)
	_Q[i] = other._Q[i];
      for (int i = 0; i < _back; i++)
	_Q[i] = other._Q[i];
    }
  }
  
};
#endif