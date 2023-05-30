#include <iostream>
#include <stdexcept>
using namespace std;

#include "SLinkedList.h"


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

  }
  
  /* 
   * Function to return the front of the lists
   * Return: A constant reference to the front of the list
   */
  template <typename Object>
  const Object& SLinkedList<Object>::front() const {

	//check if empty
        if (empty())
	  throw domain_error("list is empty");

	//if not, return reference to data in the head node

  }
  
  /*
   * Function to remove the front of the list
   */
    template <typename Object>
  void SLinkedList<Object>::removeFront() {


  }
  
  /*
   * Function to add a node to the front of the list
   * Input parameter: a variable of type Object to insert
   */
  
  template <typename Object>
  void SLinkedList<Object>::addFront(const Object& e) {



  }

    /* 
   * Destructor
   */  
  template <typename Object>
  SLinkedList<Object>::~SLinkedList() {


  }
  
  //operator=
    template <typename Object>
  SLinkedList<Object>& SLinkedList<Object>::operator=(const SLinkedList& other) {
   if (this != &other) {
	//your code here, for HW
   }
   return *this;
  }

  //copy constructor
  template <typename Object>
  SLinkedList<Object>::SLinkedList(const SLinkedList& other) {



  } //end of copy constructor 

  template <typename Object>
  void SLinkedList<Object>::printlist() {

  }
