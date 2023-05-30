#ifndef __LIST
#define __LIST

#include <stdexcept>
#include <string>
#include <iostream>
using namespace std;

/**
*  Doubly-linked list class
*/
template <typename ItemType> 
class List {
protected:
  /**
  *  Node struct
  *  The node stores data and links to the previous and next nodes in the list.
  */
  struct Node {
    ItemType _data;		//The data stored in this node
      
    Node *_next;		//Pointer to the next node in the list.
      
    Node *_prev;		//Pointer to the previous node in the list.

    /**
    *  Construct a new instance of a Node.
    *
    *  param data: the data to be stored in the node.
    *  param next: pointer to the next node in the list.
    *  param prev: pointer to the previous node in the list.
    */
    Node(const ItemType& data = ItemType(), Node *next = NULL, Node *prev= NULL) :
      _data(data), _next(next), _prev(prev) { }
  };
public:
  /**
  *  iterator class
  */
  class iterator {
    private:

      Node *_current;			//the current node the iterator is pointing at.

    public:
      /**
      *  Construct an iterator not pointing to anything.
      */
      iterator() : _current(NULL) { }

      /**
      *  Copy an existing iterator.
      *
      *  param other: the iterator to duplciate.
      */
      iterator(const iterator& other) : _current(other._current) { }

      /**
      *  Construct an iterator pointing to a specified node.
      *
      *  Note that the Node class is a private inner class, so this
      *  constructor can only be used from within the List class.
      *
      *  param loc: the location in the list to have the iterator point to.
      */
      iterator(Node* loc) : _current(loc) { }

      /**
      *  Access the data stored at the location that the iterator points to. (read-write)
      *
      *  Returns a refence to the data stored on the list.
      */
      ItemType& operator*() {
	return _current->_data;
      }

      /**
      *  Access the data stored at the location that the iterator points to. (read-only)
      *
      *  Returns a refence to the data stored on the list.
      */
      const ItemType& operator*() const {
	return _current->_data;
      }

      /**
      *  Access a pointer to the data stored at the location that the iterator points to. (read-write)
      *
      *  Returns a pointer to the data stored on the list.
      */
      ItemType* operator->() {
	return &(_current->_data);
      }

      /**
      *  Access a pointer to the data stored at the location that the iterator points to. (read-only)
      *
      *  Returns a pointer to the data stored on the list.
      */
      const ItemType * const operator->() const {
	return &(_current->_data);
      }

      /**
      *  Increment the iterator (prefix)
      *
      *  Returns a reference to the state of the pointer after incrementing.
      */
      iterator& operator++() {
	_current = _current->_next;
	return *this;
      }

      /**
      *  Increment the operator (postfix)
      *
      *  Returns a reference to the state of the pointer prior to incrementing.
      */
      iterator operator++(int dummy) {
	iterator copy(*this);
	_current = _current->_next;
	return copy;
      }

      /**
      *  Decrement the operator (prefix)
      *
      *  Returns a reference to the state of the pointer after decrementing.
      */
      iterator& operator--() {
	_current = _current->_prev;
	return *this;
      }

      /**
      *  Decrement the operator (postfix)
      *
      *  Returns a reference to the state of the pointer prior to decrementing.
      */
      iterator operator--(int dummy) {
	iterator copy(*this);
	_current = _current->_prev;
	return copy;
      }

      /**
      *  Assignment operator
      *
      *  Parameter other: the iterator to set the current one equal to.
      *  Returns a reference to the iterator
      */
      iterator& operator=(const iterator& other) {
	_current = other._current;
	return *this;
      }

      /**
      *  Check if the current iterator is identical to another.
      *
      *  Parameter other: the iterator to compare the current one to.
      *  Returns true if the iterators point to the same position in the list.
      */
      bool operator==(const iterator& other) const {
	return _current == other._current;
      }

      /**
      *  Check if the current iterator is diffent to another.
      *
      *  Parameter other: the iterator to compare the current one to.
      *  Returns true if the iterators point to the different positions in the list.
      */
      bool operator!=(const iterator& other) const {
	return _current != other._current;
      }

      friend class List;
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
      const ItemType& operator*() const {
	return _current->_data;
      }


      /**
      *  Access a pointer to the data stored at the location that the iterator points to. (read-only)
      *
      *  Returns a pointer to the data stored on the list.
      */
      const ItemType* operator->() const {
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
      const_iterator operator++(int dummy) {
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
	_current = _current->_prev;
	return *this;
      }

      /**
      *  Decrement the operator (postfix)
      *
      *  Returns a reference to the state of the pointer prior to decrementing.
      */
      const_iterator operator--(int dummy) {
	const_iterator copy(*this);
	_current = _current->_prev;
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

private:

  Node *_head;		//Pointer to the first (dummy) node of the list.

  Node *_tail;		//Pointer to the last (dummy) node of the list.

  unsigned int _size;	//Current size of the list.
  
public:
  
  /**
  *  Construct an empty instance of a list.
  */
  List() {
    
    //construct two dummy nodes
    _head = new Node();
    _tail = new Node();
    
    _head->_next = _tail;
    _tail->_prev = _head;
    
    _size = 0;
  }


/**
  *  Check if the list is empty.
  *
  *  Return true if the list is empty.
  */
  bool empty() const {
   return _size==0; 
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
    return iterator(_head->_next);
  }

  iterator end() {
    return iterator(_tail);
  }
  
  const_iterator const_begin() const {
    return const_iterator(_head->_next);
  }

  const_iterator const_end() const {
    return const_iterator(_tail);
  }  
  
  
  void insert(iterator position, ItemType element) {
    
    //create a pointer that matches the input iterator
    Node * p = position._current;
    
    //create the new node
    Node* newguy = new Node(element, p, p->_prev);
    
    //update pointers
    p->_prev = newguy;
    //(*p)._prev = newguy;
    newguy->_prev->_next = newguy;
    _size++;
  }


  iterator erase(iterator position) {
   Node* p = position._current; 
   position++;
   
   //update the pointers of p's neighbors
   p->_prev->_next = p->_next;
   p->_next->_prev = p->_prev;
   
   //delete the node and update size
   delete p;
   _size--;
   
   return position;
  }


  /**
  *  Put a new piece of data at the beginning of the list.
  *
  *  Parameter item: the data to place on the list.
  */
  void push_front(const ItemType item) {
    insert(begin(), item);
  }
  
  /**
  *  Put a new piece of data at the end of the list.
  *
  *  Parameter item: the data to place on the list.
  */
  void push_back(const ItemType item) {
    iterator last = end();
    insert(last, item);
  }

  /**
  *  Remove the first item from the list.
  *
  *  If the list is empty than an exception will be thrown.
  */
  void pop_front() {
    erase(begin());
  }

  /**
  *  Remove the last item from the list.
  *
  *  If the list is empty than an exception will be thrown.
  */
  void pop_back() {
    iterator last = end();
    last--;
    erase(last);
  }

  /** Housekeeping functions **/
  
  /**
  *  Destructor
  */
  ~List() {
    while (!empty())
      pop_front();
    delete _head;
    delete _tail;
  }
  
  /**
   * Copy Constructor
   */
  List(const List& other) {
   _head = new Node();
   _tail = new Node();
   _head->_next = _tail;
   _tail->_prev = _head;
   _size = 0;
   
   //madness:
   //Node* mypointer;
   //for (mypointer = other._head->_next; mypointer != other._tail; mypointer = mypointer->_next) 

   const_iterator guide;
   for (guide = other.const_begin(); guide != other.const_end(); guide++)
     push_back(*guide);
   
  }

  /**
    *  Create a graphviz image of the current state of the tree.
    *  Note that you don't need to mess with this one!
    */
  void draw(std::string name, iterator* iter=0, bool pause=false);
};

// The code after here is for drawing a representation of the list using GraphViz.  It
// is not needed for use of the class.
#include <fstream>
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
  Node* _front = _head;
  if (_front) {
    nodes.insert(_front);
    toExpand.push_back(_front);
  }
  Node* _back = _tail;
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
    if (next->_prev && nodes.find(next->_prev) == nodes.end()) {
      nodes.insert(next->_prev);
      toExpand.push_back(next->_prev);
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
    if ((*iter)->_prev)
      out << "node" << (long) *iter << ":prev:w -> node" << (long) (*iter)->_prev << ":e [weight=0];" << endl;
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

#endif