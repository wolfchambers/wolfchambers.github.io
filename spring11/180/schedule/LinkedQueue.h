#ifndef LINKED_QUEUE_H
#define LINKED_QUEUE_H

#include <stdexcept>
using namespace std;

/**
 * Linked Queue Interface
 **/

template <typename Object>
class LinkedQueue {

private:

  /* Node struct for queues */
  struct QNode {

    Object _data;
    QNode* _next;

    QNode(const Object& d = Object(), QNode* n = NULL) : _data(d), _next(n) {}
  };

  QNode* _head;
  QNode* _tail;
  int _size;

public:
  
  LinkedQueue();
  
  int size() const;
  
  bool empty() const;
  
  const Object& front() const;
  
  void push(const Object& e);

  void pop();
  
//Helper functions
protected:
  
  void _removeAll();
  
  void _copyFrom(const LinkedQueue& other); 
  
//Housekeeping functions
public:
  ~LinkedQueue();
  
  LinkedQueue(const LinkedQueue& other);
  
  operator=(const LinkedQueue& other);

};

#endif

