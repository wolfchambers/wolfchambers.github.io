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
  int head;   		//position of front element
  int back;		//position one past the last element
  int mysize;		//total number of elements
  Object* Q;		//pointer to the array
  
public:

  /* Constructor */  
  ArrayQueue(int cap=100) : capacity(cap), head(0), back(0), mysize(0), Q(new Object[capacity]) {}
  
  /* Function to return size */
  int size() const {
    return mysize;
  }

  /* Function that adds a new element to the end of the list */
  void push(const Object& elem) {
    
    if (size()==capacity-1) {
     throw runtime_error("Queue is full!"); 
    }
  
    Q[back] = elem;
    back = (back+1)%capacity;
    mysize++;
    
  }
  
  /*  Function to remove first element in queue  */
  void pop() {
    if (size() == 0)
      throw runtime_error("Queue is empty!");
    
    mysize--;
    head = (head+1)%capacity;
    
  }
  
  /* Function to return a const reference to the first element in the queue  */
  const Object& front() {
   return Q[head]; 
  }
  
  /*  Function that returns true if queue is empty */
  bool empty() const {
   return (mysize == 0); 
  }

  //Housekeeping
  
  ~ArrayQueue() {
    delete[] Q;
  }
  
  ArrayQueue(const ArrayQueue& other) {
    capacity = other.capacity;
    head = other.head;
    back = other.back;
    mysize = other.mysize;

    Q = new Object[mysize];

    for (int i = head; i != back; i = (i+1) % capacity) {

      Q[i] = other.Q[i];
    }
    
  }
  
  
  //write operator=
  ArrayQueue& operator=(const ArrayQueue& other) {
    if (this != &other) {

      delete[] Q;

      capacity = other.capacity;
      head = other.head;
      back = other.back;
      mysize = other.mysize;
    
      //make a deep copy!
      Q = new Object[capacity];
      
      if (head < back)
	for (int i = head; i < back; i++)
	  Q[i] = other.Q[i];
      else {
	for (int i = head; i < capacity; i++)
	  Q[i] = other.Q[i];
	for (int i = 0; i < back; i++)
	  Q[i] = other.Q[i];
      }
      
    }
    return *this;
  } //end of operator=

};
#endif
