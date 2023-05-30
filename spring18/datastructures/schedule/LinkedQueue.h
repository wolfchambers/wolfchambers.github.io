#ifndef LINKED_QUEUE_H
#define LINKED_QUEUE_H

#include <stdexcept>
using namespace std;

/** Implementation of a linked queue
* 
* Based on singly linked list class, but customized for queue operations
* 
*/

template <typename Object>
class LinkedQueue {

  private:

    //class to store our nodes
    struct Node {
     Object data;
     Node* next;
     
     //constructor for a node
     Node(const Object& e = Object(), Node* n = NULL) : data(e), next(n) {}
    };
    
    //private variables
    Node* _head;	//pointer to the first node in queue
    Node* _tail;  //pointer to end of the queue
    int _size;    //the size of the queue

    
    void removeAll() {
      while (!empty())
	pop();
    }

    void copyFrom(const LinkedQueue& other) {
      
      _size = 0;
      
      Node* temp = other._head;
      Node* current, previous;
      
      while (temp != NULL) {
	current = new Node(temp->data);
	
	if (_size == 0)
	  _head = current;
	else {
	  previous->next = current;
	}
	
	_size++;
	previous = current;
	temp = temp->next;
      }
      _tail = current;
      
    }
    
  public:

    /* Constructor - makes empty queue */
    LinkedQueue() : _head(0), _tail(0), _size(0) {
    }

    /*  size: returns integer which is current size of queue */
    int size() const {
      return _size;
    }

    /* empty: returns boolean which is true if list is empty */
    bool empty() const {
      return (_size == 0);
    }

    /* front: returns the front element of the queue */
    const Object& front() const {
      
      if (empty())
	throw domain_error("Can't access an empty queue");
      return _head->data;
    }


    /* push: takes an Object as input and adds it to the queue */
    void push(const Object& e) {
      
      //construct the new node
      Node* newguy = new Node(e,0);
      
      //put it into the list
      if (!empty()) {
	_tail->next = newguy;
	//previos line is same as: (*tail).next = newguy;
	_tail = newguy;
      }
      else {
	_head = _tail = newguy;
      }
      
      _size++;
    }

    /*  pop: remove the front element */
    void pop() {
      
      if (empty())
	throw domain_error("Can't pop from empty queue");
      
      Node* temp = _head;
      _head = _head->next;
      delete temp;
      
      _size--;
      
    }

    //Housekeeping functions
    
    /* Copy constructor */
    LinkedQueue(const LinkedQueue& other) {
      //make a deep copy
      copyFrom(other);
    }

    /* Destructor */
    ~LinkedQueue() {
      //deallocate all new nodes
      removeAll();
    }

    /* operator= */
    LinkedQueue& operator=(const LinkedQueue& other) {
      if (this != &other) {
	//deallocate all new nodes
	removeAll();
	
	//make a deep copy
	copyFrom(other);
      }
      return *this;
    }

};

#endif
