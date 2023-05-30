#include "LinkedQueue.h"

LinkedQueue::LinkedQueue() : _head(NULL), _tail(NULL), _size(0) {}

int LinkedQueue::size() const {
 return _size; 
}
  
bool LinkedQueue::empty() const {
 return (_size == 0); 
}
  
const Object& front() const {
 if (empty())
   throw runtime_error("Queue is empty");
 return _head->_data;
}
  
void push(const Object& e) {
  QNode * n = new QNode(e);
  
  if (empty())
    _head = n;
  else
    _tail->_next = n;
  
  _tail = n;
  _size++;
}

void pop() {
  if (empty())
    throw runtime_error("Queue is empty");
  QNode* temp = _head;
  _head = _head->_next;
  delete temp;
  _size--;
}

void LinkedQueue::_removeAll(){
  while (!empty()) 
    pop();
}
  
void LinkedQueue::_copyFrom(const LinkedQueue& other) {
  _head = NULL;
  QNode* model = other._head;
  QNode* prev = NULL;
  while (model != NULL) {
   QNode* v = new QNode(model->_data);
   if (_head == NULL)
     _head = v;
   else
    prev->_next = v;
   prev = v;
   model = model->_next;
  }
  
  _tail = prev;
  _size = other._size;
}

LinkedQueue::~LinkedQueue() {
  _removeAll();
}
  
LinkedQueue::LinkedQueue(const LinkedQueue& other) {
 _copyFrom(other);  
}
  
LinkedQueue& LinkedQueue::operator=(const LinkedQueue& other) {
 if (this != &other) {  
  _removeAll(); 
  _copyFrom(other);
 }
 return *this;
}