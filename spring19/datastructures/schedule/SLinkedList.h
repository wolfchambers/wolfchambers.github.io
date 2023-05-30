#ifndef SLINKEDLIST_H
#define SLINKEDLIST_H

#include <iostream>
#include <stdexcept>
using namespace std;

/* Singly Linked List Class */

template <typename Object>
class SLinkedList {
  
private:
  
  /* Node struct for singly linked lists*/
  struct SNode {
    Object _elem;
    SNode * _next;
  };
  
  //private variable list for List class
  SNode * _head;
  SNode * _tail;
  
public:
  
  /*
   * Constructor
   */
  SLinkedList(): _head(NULL), _tail(NULL) {}
  
  /* 
   * Function to test if the list is empty
   * Return: boolean value true if it is empty
   */
  bool empty() const  {
    return (_head == NULL);
  }
  
  /* 
   * Function to return the front of the list
   * Return: A constant reference to the front of the list
   */
  const Object& front() const {
    if (empty())
      throw domain_error("list is empty");
    return _head->_elem;
  }

  /* 
   * Function to return the back of the list
   * Return: A constant reference to the tail's data
   */
  const Object& back() const {
    return _tail->_elem;
  } 
  
  /*
   * Function to remove the front of the list
   */
  void removeFront() {
    SNode* temp = _head->_next;
    delete _head;
    _head = temp;

  }
  
  /*
   * Function to add a node to the front of the list
   * Input parameter: a variable of type Object to insert
   */
  void addFront(const Object& e) {
    //create new first node
    SNode* temp = new SNode;
    temp->_elem = e;
    //alternate code for above line: (*temp)._elem = e;

    //if empty, then tail also needs to be set to the new node
    if (empty()) {
      _tail = temp;
    }

    //update pointers - head to new one, and new one to old head
    temp->_next = _head;
    _head = temp;

  }


  //"Housekeeping" functions

  /*
   * Destructor
   */  
  ~SLinkedList() {
    while (!empty())
      removeFront();
  }
    
  /* 
   * Copy constructor
   */
  SLinkedList(const SLinkedList& other)  {
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
  }

  /*
   * operator=
   */
  SLinkedList& operator=(const SLinkedList& other){
   if (this != &other) {
     while (!empty())
       removeFront();

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

       if (current = other._tail)
         _tail = temp;
     }

   }
   return *this;
 }


  /*
   * extra print function for debugging
   */
  void printlist() {
  }

 
};

#endif
