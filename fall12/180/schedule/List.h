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
    
    //check for error case
    if (empty())
      throw runtime_error("List is empty");
    
    //create alias
    Node* p = position._current;
    
    //update neighbor's pointers
    p->_previous->_next = p->_next;
    p->_next->_previous = p->_previous;
    
    //deallocate memory
    position++;
    delete p;
    
    _size--;
  }
  
  
  void push_front(T element) {
    insert(begin(), element);
  }
  
  void pop_front() {
    erase(begin());
  }
  
  void push_back(T element) {
    insert(end(), element);
  }
  
  void pop_back() {
    erase(end()--);
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
    
    _size = 0;
    
    const_iterator guide;
    for (guide = other.begin(); guide != other.end(); guide++) 
      push_back(*guide);
  }
  

  /** 
   * Operator=
   */
  List& operator=(const List& other) {
    while (!empty())
      pop_front();
    
    const_iterator guide;
    for (guide = other.begin(); guide != other.end(); guide++) 
      push_back(*guide);
  }
  

    /*  Create a graphviz image of the current state of the tree.
    *  Note that you don't need to mess with this one!
    */
//  void draw(std::string name, iterator* iter=0, bool pause=false);
};


// The code after here is for drawing a representation of the list using GraphViz.  It
// is not needed for use of the class.
/* #include <fstream>
#include <list>
#include <set>
#include <iostream>
using namespace std;

template<typename ItemType> void List<ItemType>::draw(string name, iterator* drawIter, bool pause) {
  ofstream out((name + ".dot").c_str());
  out << "digraph {" << endl;
  out << "rankdir=LR;" << endl;

  // Find all of the possible nodes to consider
  set<Node *> nodes;
  list<Node *> toExpand;
  Node* _front = _sent;
  if (_front) {
    nodes.insert(_front);
    toExpand.push_back(_front);
  }
  Node* _back = _sent;
  if (_back) {
    nodes.insert(_back);
    toExpand.push_back(_back);
  }
  while (!toExpand.empty()) {
    Node *next = toExpand.front();
    toExpand.pop_front();
    if (next->_next  && nodes.find(next->_next) == nodes.end()) {
      nodes.insert(next->_next);
      toExpand.push_back(next->_next);
    }
    if (next->_previous && nodes.find(next->_previous) == nodes.end()) {
      nodes.insert(next->_previous);
      toExpand.push_back(next->_previous);
    }
  }

  // Draw nodes
  out << "_front [shape=ellipse];" << endl;
  out << "_back [shape=ellipse];" << endl;

  for (typename set<Node *>::iterator iter = nodes.begin(); iter != nodes.end(); ++iter) {
    out << "node" << (long) *iter << " [shape=record, label=\"" << (*iter)->_data;
    out << " | { <prev> | <next> }\"];" << endl;
  }

  // Links
  if (_front)
    out << "_front -> node" << (long) _front << ":w;" << endl;
  if (_back)
    out << "node" << (long) _back << ":e -> _back [dir=back];" << endl;

  for (typename set<Node *>::iterator iter = nodes.begin(); iter != nodes.end(); ++iter) {
    if ((*iter)->_next)
      out << "node" << (long) *iter << ":next:e -> node" << (long) (*iter)->_next << ":w;" << endl;
    if ((*iter)->_previous)
      out << "node" << (long) *iter << ":prev:w -> node" << (long) (*iter)->_previous << ":e [weight=0];" << endl;
  }

  // Draw iterators
  if (drawIter) {
    out << "iterator [shape=rectangle];" << endl;
    if (drawIter->_current)
      out << "iterator -> node" << (long) drawIter->_current << "[label=\"_current\"];" << endl;
  }

  out << "}" << endl;

  string command = "dot " + name + ".dot -T ps -o " + name + ".ps";
  popen(command.c_str(), "r");

  if (pause) {
    char c;
    cout << "Hit any key to continue" << endl;
    cin >> c;
  }
}
*/

#endif
