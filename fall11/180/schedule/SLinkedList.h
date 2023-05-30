#ifndef SLINKEDLIST_H
#define SLINKEDLIST_H

#include <iostream>
using namespace std;

/* Singly Linked List Class */

template <typename Object>
class SLinkedList {
  
private:
  
  /* Node class for singly linked lists*/
  struct SNode {
    Object _elem;
    SNode * _next;
  };
  
  //private variable lists
  SNode * _head;
  
public:
  
  /*
   * Constructor
   */
  SLinkedList();
  
  /* 
   * Destructor
   */  
  ~SLinkedList();
  
  /* 
   * Function to test if the list is empty
   * Return: boolean value true if it is empty
   */
  bool empty() const;
  
  /* 
   * Function to return the front of the lists
   * Return: A constant reference to the front of the list
   */
  const Object& front() const;
 
  
  /*
   * Function to remove the front of the list
   */
  void removeFront();
  
  /*
   * Function to add a node to the front of the list
   * Input parameter: a variable of type Object to insert
   */
  void addFront(const Object& e);
  
  //Copy constructor
  SLinkedList(const SLinkedList& other);
  
  //operator=
  SLinkedList& operator=(const SLinkedList& other);
 
};
  
#include "SLinkedList.tcc"  
#endif
