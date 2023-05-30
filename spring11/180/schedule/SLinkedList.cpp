#include "SLinkedList.h"
using namespace std;

  /*
   * Constructor
   */
  SLinkedList::SLinkedList() : _head(NULL){}
  

  /* 
   * Function to test if the list is empty
   * Return: boolean value true if it is empty
   */
  bool SLinkedList::empty() const {
    return (_head == NULL);
  }
  
  /* 
   * Function to return the front of the lists
   * Return: A constant reference to the front of the list
   */
  const Object& SLinkedList::front() const {
   return _head->_elem; 
  }
 
  
  /*
   * Function to remove the front of the list
   */
  void SLinkedList::removeFront() {
   SNode<Object>* oldHead = _head;
   _head = oldHead->_next;
   delete oldHead;
  }
  
  /*
   * Function to add a node to the front of the list
   * Input parameter: a variable of type Object to insert
   */
  void SLinkedList::addFront(const Object& e) {
   SNode<Object>* newguy = new SNode<Object>;
   newguy->_elem = e;
   newguy->_next = _head;
   _head = newguy;
  }

    /* 
   * Destructor
   */  
  SLinkedList::~SLinkedList() {
    while (!empty())
      removeFront();
  }
  
  //operator=
  SLinkedList& SLinkedList::operator=(const SLinkedList& other) {
   if (this != &other) {
     
   }
   return *this;
  }

  //copy constructor
  SLinkedList::SLinkedList(const SLinkedList& other) {
  } 

