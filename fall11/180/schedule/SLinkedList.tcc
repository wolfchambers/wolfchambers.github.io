#include "SLinkedList.h"
using namespace std;

  /*
   * Constructor
   */
    template <typename Object>
  SLinkedList<Object>::SLinkedList() : _head(0){}
  

  /* 
   * Function to test if the list is empty
   * Return: boolean value true if it is empty
   */
    template <typename Object>
  bool SLinkedList<Object>::empty() const {
    return (_head == 0);
  }
  
  /* 
   * Function to return the front of the lists
   * Return: A constant reference to the front of the list
   */
  template <typename Object>
  const Object& SLinkedList<Object>::front() const {
   return _head->_elem; 
  }
 
  
  /*
   * Function to remove the front of the list
   */
    template <typename Object>
  void SLinkedList<Object>::removeFront() {
   SNode* oldHead = _head;
   _head = oldHead->_next;
   delete oldHead;
  }
  
  /*
   * Function to add a node to the front of the list
   * Input parameter: a variable of type Object to insert
   */
    template <typename Object>
  void SLinkedList<Object>::addFront(const Object& e) {
   SNode* newguy = new SNode;
   newguy->_elem = e;
   newguy->_next = _head;
   _head = newguy;
  }

    /* 
   * Destructor
   */  
  template <typename Object>
  SLinkedList<Object>::~SLinkedList() {
    while (!empty())
      removeFront();
  }
  
  //operator=
    template <typename Object>
  SLinkedList<Object>& SLinkedList<Object>::operator=(const SLinkedList& other) {
   if (this != &other) {
     
     //delete original list
     while (!empty())
      removeFront();
     
     //create all new stuff
        SNode* current = other._head;
  SNode* mycurrent;
  SNode* myprevious = 0;
  
  while (current != 0) {
    
    //create new node and add data
   mycurrent = new SNode;
   mycurrent->_elem = current->_elem;   
   
   //if _head is NULL, set it to first new element, otherwise use previous pointer
   if (myprevious == 0)
    _head = mycurrent;
   else 
     myprevious->_next = mycurrent;

   //go to next node in other
   current = current->_next;
   
   //store previous
   myprevious = mycurrent;
    
  } //end while
  
  myprevious->_next = 0;
  //(*myprevious)._next = NULL;
     
   }
   return *this;
  }

//copy constructor
template <typename Object>
SLinkedList<Object>::SLinkedList(const SLinkedList& other) {
  SNode* current = other._head;
  SNode* mycurrent;
  SNode* myprevious = 0;
  
  while (current != 0) {
    
    //create new node and add data
   mycurrent = new SNode;
   mycurrent->_elem = current->_elem;   
   
   //if _head is NULL, set it to first new element, otherwise use previous pointer
   if (myprevious == 0)
    _head = mycurrent;
   else 
     myprevious->_next = mycurrent;

   //go to next node in other
   current = current->_next;
   
   //store previous
   myprevious = mycurrent;
    
  } //end while
  
  myprevious->_next = 0;
  //(*myprevious)._next = NULL;
} 

