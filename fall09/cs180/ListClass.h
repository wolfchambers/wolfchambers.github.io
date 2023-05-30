#include<iostream>

using namespace std;

  /** A full list implementation in the spirit of the std::list class.
   * A similar high-level idea is implemented in Chapter 5.1 of our text.
   */
  template <typename Object>
  class list {
  protected:
    struct Node {                                 // a node in the list
       Object element;                            // element
       Node* prev;                                // prev pointer
       Node* next;                                // next pointer
       Node(const Object& e = Object(), Node* p = NULL, Node* n = NULL)
         : element(e), prev(p), next(n) { }       // constructor
    };
  private:
    Node sentinel;       // single sentinel will mark both ends of the list
    int sz;              // number of user’s items in list (sentinels not included)
  public:
    /** Standard constructor creates an empty list. */
    list() : sz(0) {
       sentinel.prev = sentinel.next = &sentinel;
    }
    /** Returns the number of objects in the list.
      * @return number of elements
      */
    int size() const { return sz; }
    /** Determines if the list is currently empty.
      * @return true if empty, false otherwise.
      */
    bool empty() const { return sz == 0; }
    /** Returns a const reference to the front object in the list.
      * @return reference to front element
      */
    const Object& front() const { return sentinel.next->element; }
    /** Returns a live reference to the front object in the list.
      * @return reference to front element
      */
    Object& front() { return sentinel.next->element; }
    /** Returns a const reference to the last object in the list.
      * @return reference to last element
      */
    const Object& back() const { return sentinel.prev->element; }
    /** Returns a live reference to the last object in the list.
      * @return reference to last element
      */
    Object& back() { return sentinel.prev->element; }
/** Inserts an object at the front of the list.
  * @param the new element
  */
void push_front(const Object& elem) {
   Node* t = new Node(elem, &sentinel, sentinel.next);
   sentinel.next = t;       // header has new node after it
   t->next->prev = t;       // old front has new node before it
   sz++;
}
/** Inserts an object at the back of the list.
  * @param the new element
  */
void push_back(const Object& elem) {
   Node* t = new Node(elem, sentinel.prev, &sentinel);
   sentinel.prev = t;       // trailer has new node before it
   t->prev->next = t;       // old back has new node after it
   sz++;
}
/** Removes the front object from   the list. */
void pop_front() {
   Node* old = sentinel.next;    // node to remove
   sentinel.next = old->next;    // bypass old in forward direction
   old->next->prev = &sentinel; //  bypass old in reverse direction
   sz--;
   delete old;
}
/** Removes the back object from the list. */
void pop_back() {
   Node* old = sentinel.prev;    // node to remove
   sentinel.prev = old->prev;    // bypass old in reverse direction
   old->prev->next = &sentinel; // bypass old in forward direction
   sz--;
   delete old;
}
// -------------- Nested iterator class -------------------
class iterator {
   friend class list<Object>;    // give list class access
private:
   typename list<Object>::Node* node;
   iterator(Node* n) : node(n) { }
public:
   /** Default constructor gives invalid iterator */
   iterator() : node(NULL) { }
   /** Copy constructor */
   iterator(const iterator& other) : node(other.node) {}
   /** Return live reference to element */
   Object& operator*() const {
     return node->element;
   }
   /** Return live pointer to element */
   Object* operator->() const {
     return &(node->element);
   }
  /** This is the "prefix" increment operator */
  iterator& operator++() {
    node = node->next;    // mutate the iterator
    return *this;
  }
  /** This is the "postfix" increment operator */
  iterator& operator++(int) {
    iterator initial = *this;    // Make copy of initial value
    ++(*this);                   // Advance (using pre-increment)
    return initial;              // Return old value
  }
  /** This is the "prefix" decrement operator */
  iterator& operator--() {
    node = node->prev;    // mutate the iterator
    return *this;
  }
  /** This is the "postfix" decrement operator */
  iterator& operator--(int) {
    iterator initial = *this;    // Make copy of initial value
    --(*this);                   // Move backward (using pre-decrement)
    return initial;              // Return old value
  }
  bool operator==(const iterator& other) {
    return node == other.node;
  }
  bool operator!=(const iterator& other) {
    return node != other.node;
  }
}; // end iterator class
// -------------- Nested const_iterator class -------------------
class const_iterator {
  friend class list<Object>;    // give list class access
private:
  const typename list<Object>::Node* node;
  const_iterator(const Node* n) : node(n) { }
public:
  /** Default constructor gives invalid iterator */
  const_iterator() : node(NULL) { }
  /** Copy constructor */
  const_iterator(const const_iterator& other) : node(other.node) {}
  /** Return const reference to element */
  const Object& operator*() const {
    return node->element;
  }
  /** Return const pointer to element */
  const Object* operator->() const {
    return &(node->element);
  }
  /** This is the "prefix" increment operator */
  const_iterator& operator++() {
    node = node->next;   // mutate the iterator
    return *this;
  }
  /** This is the "postfix" increment  operator */
  const_iterator& operator++(int) {
    const_iterator initial = *this;    // Make copy of initial value
    ++(*this);                         // Advance (using pre-increment)
    return initial;                    // Return old value
  }
  /** This is the "prefix" decrement operator */
  const_iterator& operator--() {
    node = node->prev;                 // mutate the iterator
    return *this;
  }
  /** This is the "postfix" decrement  operator */
  const_iterator& operator--(int) {
    const_iterator initial = *this;    // Make copy of initial value
    --(*this);                         // Move backward (using pre-decrement)
    return initial;                    // Return old value
  }
  bool operator==(const const_iterator& other) {
    return node == other.node;
  }
  bool operator!=(const const_iterator& other) {
    return node != other.node;
  }
}; // end const_iterator class
friend class iterator;          // Give iterator access to list internals
friend class const_iterator;    // Give const_iterator access to list internals
iterator begin() {
  return iterator(sentinel.next);
}
const_iterator begin() const {
  return const_iterator(sentinel.next);
}
iterator end() {
  return iterator(&sentinel);         // sentinel serves as end position
}
const_iterator end() const {
  return const_iterator(&sentinel);   // sentinel serves as end position
}
    /** Insert an object immediately before the position indicated by
         the iterator. Note that it must be an iterator (as opposed to
         a const_iterator). It returns an iterator to the newly
         inserted item.
    */
    iterator insert(iterator p, const Object& element) {
       Node* after = p.node;
       Node* v = new Node(element, after->prev, after);
       after->prev->next = v;
       after->prev = v;
       sz++;
       return iterator(v);
    }
    /** erase the item at the given iterator. Returns an iterator to
         the position that follows the deleted item.
    */
    iterator erase(iterator p) {
       Node* old = p.node;
       Node* after = old->next;
       after->prev = old->prev;
       old->prev->next = after;
       delete old;
       sz--;
       return iterator(after);
    }
  protected:
    void removeAll() {                    // remove list contents
       while (!empty()) pop_front();
    }
    void copyFrom(const list& other) {       // copy from other
       // assumes that this list is properly empty
       for (const_iterator ci = other.begin(); ci != other.end(); ++ci)
         push_back(*ci);
    }
  public:
    /** Copy constructor */
    list(const list& other) : sz(0) {
       sentinel.next = sentinel.prev = &sentinel;
       copyFrom(other);
    }
    /** Destructor */
    ~list() {
      removeAll();      // get rid of contents between sentinels
    }
    /** Assignment operator */
    list& operator=(const list& other) {
       if (this != &other) {                        // avoid self copy (x = x)
         removeAll();                               // remove old contents
         copyFrom(other);                           // copy new contents
       }
       return *this;
    }
  }; // end of list class



