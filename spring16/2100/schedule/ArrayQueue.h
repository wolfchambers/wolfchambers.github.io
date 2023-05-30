#ifndef ARRAY_QUEUE_H
#define ARRAY_Q_H

#include <iostream>
#include <stdexcept>
using namespace std;


/* 
   Class to implement a queue with an underlying array
*/

template <typename Object>
class ArrayQueue {
  
private:
  
  /** Variable declaration **/
  int capacity;   	//maximum capacity of the array
  int _front;   		//position of front element
  int back;		//position one past the last element
  int _size;		//total number of elements
  Object* Q;		//pointer to the array
  
public:

  /* Constructor */  
  ArrayQueue(int cap=100) : capacity(cap), _front(0), back(0), _size(0), Q(new Object[capacity]) {}
  
  /* Function to return size */
  int size() const {
    return _size;
  }

  /* Function that adds a new element to the end of the list */
  void push(const Object& elem) {
    
    if (size()==capacity) {
     throw runtime_error("Queue is full!"); 
    }
  
    Q[back] = elem;
    back = (back+1)%capacity;
    _size++;
    
  }
  
  /*  Function to remove first element in queue  */
  void pop() {
    if (size() == 0)
      throw runtime_error("Queue is empty!");
    
    _size--;
    _front = (_front+1)%capacity;
    
  }
  
  /* Function to return a const reference to the first element in the queue  */
  const Object& front() {
   return Q[_front]; 
  }
  
  /*  Function that returns true if queue is empty */
  bool empty() const {
   return (_size == 0); 
  }

  //Housekeeping
  
  ~ArrayQueue() {
    delete[] Q;
  }
  
  ArrayQueue(const ArrayQueue& other) {
    capacity = other.capacity;
    _front = other._front;
    back = other.back;
    _size = other._size;
    
    for (int i = _front; i != back; i = (i+1) % capacity) {
      Q[i] = other.Q[i];
    }
    
  }
  
  
  //write operator=
  ArrayQueue& operator=(const ArrayQueue& other) {
    if (this != &other) {

      delete[] Q;

      capacity = other.capacity;
      _front = other._front;
      back = other.back;
      _size = other._size;
    
      //make a deep copy!
      Q = new Object[capacity];
      
      if (_front < back)
	for (int i = _front; i < back; i++)
	  Q[i] = other.Q[i];
      else {
	for (int i = _front; i < capacity; i++)
	  Q[i] = other.Q[i];
	for (int i = 0; i < back; i++)
	  Q[i] = other.Q[i];
      }
      
    }
    return *this;
  } //end of operator=

};
#endif
