#ifndef LINKED_QUEUE_H
#define LINKED_QUEUE_H

#include <stdexcept>
using namespace std;

/** Implementation of a linked queue
* 
* Based on circular linked list class, but customized for queue operations
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
    Node* head;	//pointer to the first node in queue
    Node* tail;  //pointer to end of the queue
    int _size;    //the size of the queue

    //helper functions
    
    //helper to remove all nodes in current list
    void removeAll() {
     while (!empty())
       pop();
    }
    
    //helper to make a deep copy
    void copyFrom(const LinkedQueue& other) {
      Node* othernode = other.head;
      head = 0;
      Node* newnode = 0;
      Node* previousnode = 0;
      for (int i=0; i < other.size(); i++) {
	newnode = new Node(othernode->data);
	if (i==0)
	  head = newnode;
	else
	  previousnode->next = newnode;
	previousnode = newnode;
      }
      
      tail = newnode;
      _size = other._size;
      
    }


  public:

    /* Constructor - makes empty queue */
    LinkedQueue() : head(0), tail(0), _size(0) {
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
	throw runtime_error("queue is empty");
      
      return head->data;
    }


    /* push: takes an Object as input and adds it to the queue */
    void push(const Object& e) {
      
      //construct the new node
      Node* newguy = new Node(e,0);
      
      //put it into the list
      if (!empty()) {
	tail->next = newguy;
	//previos line is same as: (*tail).next = newguy;
	tail = newguy;
      }
      else {
	head = tail = newguy;
      }
      
      _size++;
    }

    /*  pop: remove the front element */
    void pop() {
      if (empty())
	throw runtime_error("queue is empty");
      
      //check if tail is about to be deleted, and update if so
      if (_size == 1)
	tail = 0;
      
      //delete old head and update head
      Node* temp = head;
      head = head->next;
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
