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
    return (_head == NULL);
  }
  
  /* 
   * Function to return the front of the lists
   * Return: A constant reference to the front of the list
   */
  template <typename Object>
  const Object& SLinkedList<Object>::front() const {
      return _head->_elem;
      //return (*head)._elem;
  }
 
  
  /*
   * Function to remove the front of the list
   */
    template <typename Object>
  void SLinkedList<Object>::removeFront() {
    
    if (empty()) 
      throw domain_error("Can't remove from an empty list");
    
    //update head
    SNode* oldhead = _head;
    _head = _head->_next;
    
    //delete old head
    delete oldhead;
  }
  
  /*
   * Function to add a node to the front of the list
   * Input parameter: a variable of type Object to insert
   */
  
  template <typename Object>
  void SLinkedList<Object>::addFront(const Object& e) {
    //create the new node
    SNode* temp = new SNode;
    (*temp)._elem = e;
    //temp->_elem = e;
    
    //update the pointers
    temp->_next = _head;
    _head = temp;

  }

    /* 
   * Destructor
   */  
  template <typename Object>
  SLinkedList<Object>::~SLinkedList() {
    
    //if list is not empty, get rid of things
    while (_head != NULL) {
      removeFront();
    }

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
    
    //travel through other, copying as we go
    SNode* current = other._head;
    SNode* previous = NULL;
    
    while (current != NULL) {
     
      SNode* temp = new SNode;
      temp->_elem = current->_elem;
      
      if (previous == NULL)
      {
	_head = temp;
	
      }
      else {
	previous->_next = temp;
	
      }
      previous = temp;
      current = current->_next;
    }
    


  } //end of copy constructor 

