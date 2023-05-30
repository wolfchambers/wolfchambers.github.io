#include "DLinkedList.h"

/**
 * Constructor
 **/
/*DLinkedList<Object>::DLinkedList() {
  _head = new DNode;
  _tail = new DNode;
  _head->_next = _tail;
  _tail->_prev = _head;
}

/** 
 * Destructor
 **//*  
DLinkedList::~DLinkedList() {
  while (!empty()) 
    removeFront();
  delete _head;
  delete _tail;
}
  
/** 
 * Function to test if the list is empty
 * Return: boolean value true if it is empty
 **/
bool DLinkedList::empty() const {
  return (_head->_next == _tail);
}
  
/** 
 * Function to return the front of the lists
 * Return: A constant reference to the front of the list
 **/
const Object& DLinkedList::front() const {
  return (_head->_next->_elem);
}

/** 
 * Function to return the back of the list
 * Return: A constant reference to the back of the list
 **/
const Object& DLinkedList::front() const {
  return (_tail->_prev->_elem);
}

  
/**
 * Function to remove the front of the list
 **/
void DLinkedList::removeFront() {
  remove(_head->_next);
}
  
/**
 * Function to add a node to the front of the list
 * Input parameter: a variable of type Object to insert
 **/
void DLinkedList::addFront(const Object& e) {
  add(_head->_next, e);
}
  
/**
 * Function to remove the back of the list
 **/
void DLinkedList::removeBack() {
  remove(_tail->_prev);
}
  
/**
 * Function to add a node to the back of the list
 * Input parameter: a variable of type Object to insert
 **/
void DLinkedList::addBack(const Object& e) {
  add(_tail, e);
}

/**
 * Protected helper functions
 */

void add(DNode* v, const Object& e) {
 DNode* u = new DNode;
 u->_elem = e;
 u->_next = v;
 u->_prev = v->_prev;
 v->_prev->_next = v->_prev = u;
}
  
void remove(DNode* v) {
  DNode* u = v->_prev;
  DNode* w = v->_next;
  u->_next = w;
  w->prev = u;
  delete v;
}