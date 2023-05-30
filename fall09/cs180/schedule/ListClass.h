#ifndef CSCI180_LIST_H
#define CSCI180_LIST_H

template <typename Object>
class ListClass {

  protected:
    struct Node {
      Object element;
      Node* prev;
      Node* next;

      //constructor
      Node(const Object& e = Object(), Node* p = NULL, Node* n= NULL) : element(e), prev(p), next(n) {} 
    }

  private:
    Node sentinal;
    int size;

  public:
    
    ListClass() : size(0) {
	sentinal.prev = sentinal.next = &sentinal;
    }

    int size() const { return size; }

    bool empty() const { return size == 0; }

    void push_front(const Object& elem) {
	Node* t = new Node(elem, &sentinal, sentinal.next);
	sentinal.next = t;
	t->next->prev = t;
	//*((*t).next).prev = t;
	size++;
    }

    void pop_front() {
	Node* old = sentinal.next;
	sentinal.next = old->next;
	old->next->prev = &sentinal;
	size--;
	delete old;
    }

    //--------------- Nested iterator class -----------
    class iterator {
	friend class ListClass<Object>;

	private:
	  typename ListClass<Object>::Node* node;

	  //private constructor that list will use
	  iterator(Node* n) : node(n) {}

	public:
	  //constructor - defaults to invalid iterator
	  iterator() : node(NULL) { } 

	  //copy constructor
	  iterator(const iterator& other): node(other.node) {}

	  //return a live reference to list object
	  Object& operator*() {
		return node->elem;
   	  }

	  //return live pointer to the object
	  Object* operator->() {
		return &(node->elem);
	  }

	  //increment operator
	  iterator& operator++ () {
		node = node->next;
		return *this;
  	  }

	  //decrement operator
	  iterator& operator-- () {
		node = node->prev;
		return *this;
	  }

	  //"postfix" increment operator
	  iterator& operator++(int) {
		iterator initial = *this;
		++(*this);
		return initial;
	  }

	  //comparison
	  bool operator==(const iterator& other) {
		return node == other.node;
	  }
	}; //end nested iterator class

	//const nest iterator class
	class const_iterator {

	private:
	  const typename ListClass<Object>::Node* node;
	  const_iterator(const Node* n) : node(n) {}

	public:

	  //return a const reference to list object
	  const Object& operator*() const {
		return node->elem;
   	  }

	};

	friend class iterator;
	friend class const_iterator;

	iterator begin() {
	  return iterator(sentinal.next);
	}

	iterator end() {
	  return iterator(sentinal.prev);
	}

	iterator insert(iterator p, const Object& element) {
	  Node* after = p.node;
	  Node* v = new Node(element, after->prev, after);
	  after->prev = p;
	  after->prev->next = p;
	  size++;
	  return iterator(v);
	}

	}; //end of const_iterator

	friend class iterator;
	friend class const_iterator;

	//insert element immediately before indicated iterator
	//returns iterator to new item
	iterator insert(iterator p, const Object& element) {
	  Node* after = p.node;
	  Node* v = new Node(element, after->prev, after);
	  after->prev->next = v;
	  after->prev = v;
	  size++;
	  return iterator(v);
	}

	iterator erase(iterator p) {
	  Node* old = p.node;
	  Node* after = old->next;
	  after->prev = old->prev;
	  old->prev->next = after;
	  delete old;
	  size--;
	  return iterator(after);
	}

	protected:
	
	void removeAll() {
	  while (!empty()) pop_front();
	}

	void copyFrom(const list& other) {
	  //assumes this list is actually empty
	  for (const_iterator ci = other.begin(); ci != other.end(); ++ ci)
	    push_back(*ci);
	}

	public:

	//copy constructor
	ListClass(const list& other): size(0) {
	  sentinel.next = sentinel.prev = & sentinel;
	  copyFrom(other);
	}

	//destructor
	~ListClass () {
	  removeAll();
	}

	//assignment operator
	list& operator=(const list& other) {
	  if (this!= &other) {
	    removeAll();
	    copyFrom(other);
	  }
	  return *this;
	}

}; //end of list class
    