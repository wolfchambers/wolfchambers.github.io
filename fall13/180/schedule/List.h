#ifndef __LIST
#define __LIST

#include <stdexcept>
#include <iostream>
#include <string>
using namespace std;

/** Doubly linked list class **/

template <typename T>
class List {
  
private:
  
  /** Node struct **/
  struct Node {
    Node* _previous;
    Node* _next;
    T _data;
    
    Node(const T& d = T(), Node* p = NULL, Node* n = NULL) : _data(d),  _previous(p), _next(n) {}
    
  };

  
public:
  
  /** Iterator class **/
  class iterator {
  private: 
    Node* _current;
    
  public: 
    
    /**
      *  Construct an iterator not pointing to anything.
    */
    iterator() : _current(NULL) {}
    
    /**
      *  Construct an iterator pointing to a specified node.
      *
      *  Note that the Node class is a private inner class, so this
      *  constructor can only be used from within the List class.
      *
      *  param position: the location in the list to have the iterator point to.
      */
    iterator(Node* position) : _current(position) {}
    
      /**
      *  Copy an existing iterator.
      *
      *  param other: the iterator to duplciate.
      */
      iterator(const iterator& other) : _current(other._current) { }
      
      /**
      *  Access the data stored at the location that the iterator points to. (read-write)
      *
      *  Returns a reference to the data stored on the list.
      */
      T& operator*() {
	return _current->_data;
      }

      /**
      *  Access the data stored at the location that the iterator points to. (read-only)
      *
      *  Returns a reference to the data stored on the list.
      */
      const T& operator*() const {
	return _current->_data;
      }

      /**
      *  Access a pointer to the data stored at the location that the iterator points to. (read-write)
      *
      *  Returns a pointer to the data stored on the list.
      */
      T* operator->() {
	return _current->_data;
      }

      /**
      *  Access a pointer to the data stored at the location that the iterator points to. (read-only)
      *
      *  Returns a pointer to the data stored on the list.
      */
      const T* const operator->() const {
	return _current->_data;
      }

      /**
      *  Increment the iterator (prefix)
      *
      *  Returns an iterator to the state of the pointer after incrementing.
      */
      iterator& operator++() {
	_current = _current -> _next;
	return *this;
      }

      /**
      *  Increment the operator (postfix)
      *
      *  Returns an iterator to the state of the pointer prior to incrementing.
      */
      iterator operator++(int dummy) {
	iterator temp(*this);
	_current = _current -> _next;
	return temp;
      }

      /**
      *  Decrement the operator (prefix)
      *
      *  Returns a reference to an iterator to the state of the pointer after decrementing.
      */
      iterator& operator--() {
	_current = _current -> _previous;
	return *this;
      }

      /**
      *  Decrement the operator (postfix)
      *
      *  Returns a reference iterator to the state of the pointer prior to decrementing.
      */
      iterator operator--(int dummy) {
	iterator temp(*this);
	_current = _current -> _previous;
	return temp;
      }

      /**
      *  Assignment operator
      *
      *  Parameter other: the iterator to set the current one equal to.
      *  Returns a reference to the iterator
      */
      iterator& operator=(const iterator& other) {
	_current = other._current;
      }

      /**
      *  Check if the current iterator pointing to the same Node as another.
      *
      *  Parameter other: the iterator to compare the current one to.
      *  Returns true if the iterators point to the same position in the list.
      */
      bool operator==(const iterator& other) const {
	return (_current == other._current);
      }      
    
      /**
      *  Check if the current iterator is diffent to another.
      *
      *  Parameter other: the iterator to compare the current one to.
      *  Returns true if the iterators point to the different positions in the list.
      */
      bool operator!=(const iterator& other) const {
	return (_current != other._current);
      }

      friend class List;  //Allow list to use private data   
    
  }; //end of iterator class 

  /**
  *  const_iterator class
  */
  class const_iterator {
    private:

      Node *_current;			//the current node the iterator is pointing at.

    public:
      /**
      *  Construct a const_iterator not pointing to anything.
      */
      const_iterator() : _current(NULL) { }

      /**
      *  Copy an existing const_iterator.
      *
      *  param other: the iterator to duplciate.
      */
      const_iterator(const const_iterator& other) : _current(other._current) { }

      /**
      *  Construct an iterator pointing to a specified node.
      *
      *  Note that the Node class is a private inner class, so this
      *  constructor can only be used from within the List class.
      *
      *  param loc: the location in the list to have the iterator point to.
      */
      const_iterator(Node* loc) : _current(loc) { }

      /**
      *  Access the data stored at the location that the iterator points to. (read-only)
      *
      *  Returns a refence to the data stored on the list.
      */
      const T& operator*() const {
	return _current->_data;
      }


      /**
      *  Access a pointer to the data stored at the location that the iterator points to. (read-only)
      *
      *  Returns a pointer to the data stored on the list.
      */
      const T* operator->() const {
	return &(_current->_data);
      }

      /**
      *  Increment the iterator (prefix)
      *
      *  Returns a reference to the state of the pointer after incrementing.
      */
      const_iterator& operator++() {
	_current = _current->_next;
	return *this;
      }

      /**
      *  Increment the operator (postfix)
      *
      *  Returns a reference to the state of the pointer prior to incrementing.
      */
      const_iterator& operator++(int dummy) {
	const_iterator copy(*this);
	_current = _current->_next;
	return copy;
      }

      /**
      *  Decrement the operator (prefix)
      *
      *  Returns a reference to the state of the pointer after decrementing.
      */
      const_iterator& operator--() {
	_current = _current->_previous;
	return *this;
      }

      /**
      *  Decrement the operator (postfix)
      *
      *  Returns a reference to the state of the pointer prior to decrementing.
      */
      const_iterator operator--(int dummy) {
	const_iterator copy(*this);
	_current = _current->_previous;
	return copy;
      }

      /**
      *  Assignment operator
      *
      *  Parameter other: the iterator to set the current one equal to.
      *  Returns a reference to the iterator
      */
      const_iterator& operator=(const const_iterator& other) {
	_current = other._current;
	return *this;
      }

      /**
      *  Check if the current iterator is identical to another.
      *
      *  Parameter other: the iterator to compare the current one to.
      *  Returns true if the iterators point to the same position in the list.
      */
      bool operator==(const const_iterator& other) const {
	return _current == other._current;
      }

      /**
      *  Check if the current iterator is diffent to another.
      *
      *  Parameter other: the iterator to compare the current one to.
      *  Returns true if the iterators point to the different positions in the list.
      */
      bool operator!=(const const_iterator& other) const {
	return _current != other._current;
      }

      friend class List;
  }; //end of iterator class  

private:  //Private variables for List class

  Node* _sent;		//Pointer to the (dummy) sentinal node of the list.

  unsigned int _size;	//Current size of the list.

public:
  
  /**
  *  Construct an empty instance of a list.
  */
  List() {
    _sent = new Node();
    _sent->_next = _sent;
    _sent->_previous = _sent;
    _size = 0;
  }

/**
  *  Check if the list is empty.
  *
  *  Return true if the list is empty.
  */
  bool empty() const {
   return (_size == 0);
  }
  
  
  /**
  *  Return the number of elements in the list.
  *
  *  Return the size of the list.
  */
  int size() const {
    return _size;
  }
  
  iterator begin() {
    return iterator(_sent->_next);
  }
  
  iterator end() {
    return iterator(_sent);
  }
  
  const_iterator const_begin() const {
    return const_iterator(_sent->_next);
  }

  const_iterator const_end() const {
    return const_iterator(_sent);
  }  
  
  /** 
   * Function to insert into the list at a given spot
   * 
   * Parameter position: an iterator we wish to insert before
   * Parameter element: the value to insert
   */
  void insert(iterator position, T element) {
    
    //create a pointer which is an "alias" for position
    Node* p  = position._current;

    //make the new node and put it in list
    Node* newguy = new Node(element, p->_previous, p);
    (p->_previous)->_next = newguy;
    p->_previous = newguy;
    _size++;

  }

  /** Function to erase a node
   * 
   * Parameter: an iterator to the node we wish to delete
   * Returns an iterator to the next node in the list
   */
  iterator erase(iterator position) {
    //throw some errors
    Node* p = position._current;
    if ((p == NULL) || (p == _sent))
      throw domain_error("not a valid iterator");
    if (_size == 0)
      throw runtime_error("list is already empty");
    
    
    Node* previous = p->_previous;
    Node* next = p->_next;
    
    previous->_next = next;
    next->_previous = previous;
    
    delete p;
    _size--;
    
    return iterator(next);
  }
  
  
  void push_front(T element) {
    insert(iterator(_sent->_next), element);
    //insert(begin(), element);
  }
  
  void pop_front() {
    erase(begin());
  }
  
  void push_back(T element) {
    insert(end(), element);
  }
  
  void pop_back() {
    erase(iterator(_sent->_previous));
  }
  
  
  /** Housekeeping Functions **/
  
  /** 
   * Destructor
   */
  ~List() {
    while (!empty())
      pop_front();
    delete _sent;
  }
  
  /** Copy Constructor **/
  List (const List& other) {
    _sent = new Node();
    _sent->_next = _sent;
    _sent->_previous = _sent;
    _size=0;
    
    const_iterator temp = other.const_begin();
    while (temp != other.const_end()){
      //copy the node over
      push_back(*temp);
      temp++;
    }
  }
  

  /** 
   * Operator=
   */
  List& operator=(const List& other) {
    if (this != &other) {
      while (!empty())
	pop_front();
      
    const_iterator temp = other.const_begin();
    while (temp != other.const_end()){
      //copy the node over
      push_back(*temp);
      temp++;
      }      
    }
    return *this;

  }
  

};


#endif
