#include "SLinkedList.h"
#include <iostream>
#include <stdexcept>
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
    return _head -> _elem;
  }
 
  
  /*
   * Function to remove the front of the list
   */
    template <typename Object>
  void SLinkedList<Object>::removeFront() {
    
    //throw error if list is empty
    if (_head == 0)
      throw runtime_error("Can't remove from an empty list");
    
    //move head down the list and delete old head
    SNode* temp = _head;
    _head = _head -> _next;
    delete temp;
  }
  
  /*
   * Function to add a node to the front of the list
   * Input parameter: a variable of type Object to insert
   */
  
  template <typename Object>
  void SLinkedList<Object>::addFront(const Object& e) {
    
    //creating the new node
    SNode* temp = new SNode;
    temp -> _elem = e;
    temp -> _next = _head;
    
    //update _head
    _head = temp;

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
  //equivalent to:
  //(*myprevious)._next = NULL;

} 

