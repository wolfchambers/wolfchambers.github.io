#include "SLinkedList.h"
#include <iostream>
#include <stdexcept>
using namespace std;

  /*
   * Constructor
   */
  template <typename Object>
  SLinkedList<Object>::SLinkedList() : _head(NULL){}
  

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
        if (empty())
	  throw domain_error("list is empty");
 	return _head->_elem;
  }
  
  /*
   * Function to remove the front of the list
   */
    template <typename Object>
  void SLinkedList<Object>::removeFront() {
	if (empty())
	  throw domain_error("can't remove from empty list");

	//save old head location, and point to 2nd element in list
	SNode* oldhead = _head;
	_head = _head->_next;    

	//remove the unneeded node (old head)
	delete oldhead;
  }
  
  /*
   * Function to add a node to the front of the list
   * Input parameter: a variable of type Object to insert
   */
  
  template <typename Object>
  void SLinkedList<Object>::addFront(const Object& e) {
	//create new first node
	SNode* temp = new SNode;
        temp->_elem = e;
	//alternate: (*temp)._elem = e;

	//update pointers - head to new one, and new one to old head
	temp->_next = _head;
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
	//your code here
   }
   return *this;
  }

  //copy constructor
  template <typename Object>
  SLinkedList<Object>::SLinkedList(const SLinkedList& other) {
	//travel through other list, copying each node 
        SNode* current = other._head;
	SNode* previous = NULL;

	//if we have a node at current, copy it
	while (current != NULL) {
	  SNode* temp = new SNode;
	  temp -> _elem = current->_elem;

	  if (previous == NULL)
	    _head = temp;
	  else
	    previous->_next = temp;

	  previous = temp;
	  current = current->_next;
	}
	

  } //end of copy constructor 

  template <typename Object>
  void SLinkedList<Object>::printlist() {
    SNode* temp = _head;
    if (empty())
	cout << "empty list" << endl;
    else {
      while (temp != NULL) {

        cout << temp->_elem << " -> ";
        temp = temp->_next;
      }
      cout << "NULL" << endl;
   }
}
