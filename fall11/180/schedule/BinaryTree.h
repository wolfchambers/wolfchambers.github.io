#include <string>
#include <iostream>
#include <stdexcept>
using namespace std;

/**
 * Binary Tree class
 */

template <typename ItemType>
class BinaryTree {
  
private: 
  struct Node {
      ItemType _data;
    
      Node* _parent;    //pointer to parent node
      Node* _left;	//pointer to left child
      Node* _right;	//pointer to right child
      
      int _aux;		//auxilary info (for future use)
      
      //constructor
      Node(const ItemType& data, Node* parent = NULL, Node* left = NULL, Node* right = NULL, int aux = 0) : _data(data), _parent(parent), _left(left), _right(right), _aux(aux) {}
      
    }; //end struct
    
public:
    
    /**
    * Iterator class for moving within the tree
    **/
    class Iterator {
      
      private:
	Node* _current; 	//pointer to current node
	BinaryTree* _tree;	//pointer to tree I belong to
	
      public:
	
	//constructor for iterator
	Iterator(Node* c = NULL, BinaryTree* t = NULL) : _current(c) , _tree(t) {}
	
	//copy constructor
	Iterator(const Iterator& other) {
	  _current = other._current;
	  _tree = other._tree;
	}
	
	//returns reference to data
	ItemType& operator*() const {
	  return _current->_data;
	}
	
	//returns const pointer to data
	ItemType* operator->() const {
	  return &(_current->_data);
	}
	
	//Returns an interator to the left child of the iterator
	Iterator left() {
	  return Iterator(_current->_left, _tree);
	}
	
	//Returns an interator to the right child of the iterator
	Iterator right() {
	  return Iterator(_current->_right, _tree);
	}
	
	//Returns an iterator to the parent
	Iterator up() {
	  return Iterator(_current->_parent, _tree);
	}
	
	//Returns true if the iterator points to the root
	bool isRoot() {
	  return (_current == _tree->_root);
	}
	
	//Returns true if the iterators point to the same thing
	bool operator==(const Iterator& other) {
	  return (_current == other._current && _tree == other._tree);
	}
	  
	//Returns true if the 2 iterators are NOT equal
	bool operator!=(const Iterator& other) {
	  return (_current != other._current || _tree != other._tree);
	}
	  
	//Returns true if the iterator has a left child
	bool hasLeftChild() {
	  return (_current->_left != NULL);
	}
	
	//Returns true if the iterator has a right child
	 bool hasRightChild() {
	   return (_current->_right != NULL);
	} 
	
	//Returns true if the iterator points to a leaf node
	bool isLeaf() {
	  return (!hasRightChild() && !hasLeftChild());
	}
	
	//Returns true if the iterator is NULL
	bool isNULL() {
	  return (_current == NULL);
	}
	
	//Find the next node in an inorder traversal - prefix
	Iterator operator++() {
	  //if there is a right child, go to it, and then left as much as possible
	  if (hasRightChild()) {
	    *this = right();
	    while (hasLeftChild()) 
	      *this = left();
	  }
	  else { //no right child, so go up as long as we're the right child, then up one more time
	    while (!isRoot() && (up().right() == *this))
	      *this = up();
	    *this = up();
	  }
	  return *this;  	  

	}
	
	//Find the next node in an inorder traversal - postfix
	Iterator operator++(int dummy) {
	  Iterator temp = *this;
	  //if there is a right child, go to it, and then left as much as possible
	  if (hasRightChild()) {
	    *this = right();
	    while (hasLeftChild()) 
	      *this = left();
	  }
	  else { //no right child, so go up as long as we're the right child, then up one more time
	    while (!isRoot() && (up().right() == *this))
	      *this = up();
	    *this = up();
	  }
	  return temp;  	 

	}
	  
	friend class BinaryTree;
	  
    }; //end of iterator class
    
private:

    int _size;  	//size of binary tree
    Node* _root;	//pointer to root node in binary tree

    
protected:
  
  /** function to recursively delete a subtree 
  * Input parameter: node pointer indicated which subtree to remove
  **/
  void _recursivelyDelete(Iterator iter) {
    //base case: do nothing if node is NULL
    if (!iter.isNULL()) {
      
      //postorder deletion
      _recursivelyDelete(iter.left());
      _recursivelyDelete(iter.right());
      delete iter._current;
      _size--;
    }
   
    //blank else
  }
  
  /**function to recursively! duplicate a subtree
  * Input parameter: node pointing to subtree that should be copied
  * Return a pointer to the root of the duplicate tree
  **/
  Node* _duplicate(const Node* other) {
    
    //base case
    if (other == NULL)
      return NULL;
    else { //not null: do preorder creation
      
      //create the node
      Node* tempNode = new Node(other->_data);
      tempNode->_aux = other->_aux;
      
      //set up left subtree
      tempNode->_left = _duplicate(other->_left);
      if (tempNode->_left != NULL)
	tempNode->_left->_parent = tempNode;
      
      //set up right subtree
      tempNode->_right = _duplicate(other->_right);
      if (tempNode->_right != NULL)
	tempNode->_right->_parent = tempNode;    
      
      _size++;
      
      return tempNode;
    }
  }
    
public:
  
  /**
   * Constructor
   */
  BinaryTree() : _root(NULL), _size(0) {}
  
  /** 
   * Copy Constructor
   */
  BinaryTree(const BinaryTree& other) {
    _size = 0;
    _root = _duplicate(other._root);
  }
  
  /** 
   * Destructor 
   */
  ~BinaryTree() {
    _recursivelyDelete(Iterator(_root));
  }
  
  /**
  *  Returns size of the tree
  */
  int size() const {
    return _size;
  }

  /**
  *  Returns true if the tree is empty
  */
  bool empty() const {
    return (_size == 0);
  }
  
  int getAuxiliary(Iterator iter) const {
    return iter._current->_aux;
    //return (*iter)->_aux;
  }
  
  void setAuxiliary(int value, Iterator iter) {
    iter._current->_aux = value;
  }
  
  void createRoot(const ItemType& value) {
    _root = new Node(value);
    _size = 1;
  }
  
  
  /** function to insert new data as the right child of a specified node
   * If the right child already exists, delete it (and its subtree)
   */
  void insertAsRightChild(const ItemType& value, Iterator iter) {
    //if right child exists, delete it
    _recursivelyDelete(iter._current->_right);

    //insert the new right child
    iter._current->_right = new Node(value, iter._current);
    _size++;
    
  }
  
  void insertAsLeftChild(const ItemType& value, Iterator iter) {
    //if right child exists, delete it
    _recursivelyDelete(iter._current->_left);

    //insert the new right child
    iter._current->_left = new Node(value, iter._current);
    _size++;   
  }
  
  Iterator root() {
    return Iterator(_root, this);
  }
  
  Iterator begin() {
   Node* start = _root;
   
   while (start != NULL && start->_left != NULL)
     start = start->_left;
   
   return Iterator(start, this);
  }
  
  Iterator end() {
    return Iterator(NULL, this);
  }
  
  /** Deleting an indicated node, and promoting its left child
   * Any nodes in right subtree are deleted
   */
  void deleteAndMoveLeftChildUp(Iterator location) {
    //delete any right subtree
    _recursivelyDelete(location._current->_right);
    
    //if left child is not NULL, reset parent pointer
    if (location._current->_left != NULL) 
     location._current->_left->_parent = location._current->_parent;
    
    //if location is not the root, update parent's left or right
    if (!location.isRoot()) {
      
      //if location is a left child, update parent's left pointer
      if (location._current->_parent->_left == location._current)
       location._current->_parent->_left = location._current->_left;
      else //location is a right child
	location._current->_parent->_right = location._current->_left;
    }
    else { //location is the root
      _root = location._current->_left;
    }
    
    _size--;
    delete location._current;    


    
  }

    /**
     *  Delete a node from the tree advancing its right child.
     *
     *  The right child of the node will take the place of the specified
     *  node.  The node and its left subtree will be deleted.
     *
     *  Input parameter location: an iterator referencing the node to be deleted.
     */
    void deleteAndMoveRightChildUp(Iterator location) {
      _recursivelyDelete(location._current->_left);

      // If theres a right child make its parent the one above this one
      if (location._current->_right != 0)
        location._current->_right->_parent = location._current->_parent;

      // If this nodes has a parent (not the root) have it point to the right child
      if (location._current->_parent != 0) {
        if (location._current->_parent->_left == location._current) // It's the left child
          location._current->_parent->_left = location._current->_right;
        else // It's the right child
          location._current->_parent->_right = location._current->_right;
      }
      else {  // The current node is the root
        _root = location._current->_right;
      }

      // Delete the node
      delete location._current;
      _size--;
    }
    
    /** pivot function
     * input: iterator
     * swap position of input iterator and its parent
     */
    void pivot(Iterator location) {
      
      if (location.isRoot())
	throw runtime_error("cannot pivot the root");
      
      Node* parent = location._current->_parent;
      Node* child = location._current;
      
      if (child == parent->_right) {
	//location is a right child
	
	Node* t2temp = child->_left;
	Node* parentparent = parent->_parent;
	
	//fix child
	child->_parent = parent->_parent;
	child->_left = parent;
	
	//fix parent
	parent->_parent = child;
	parent->_right = t2temp;
	
	//fix parent's parent
	if (parent != _root) {
	  if (parentparent->_left == parent)
	    parentparent->_left = child;
	  else
	    parentparent->_right = child;
	}
	else 
	  _root = child;
	
	//fix subtree T2, if it exists
	if (t2temp != NULL)
	  t2temp->_parent = parent;	
	
      }
      else {
	//location is a left child
	
	Node* t2temp = child->_right;
	Node* parentparent = parent->_parent;
	
	//fix child
	child->_parent = parent->_parent;
	child->_right = parent;
	
	//fix parent
	parent->_parent = child;
	parent->_left = t2temp;
	
	//fix parent's parent
	if (parent != _root) {
	  if (parentparent->_left == parent)
	    parentparent->_left = child;
	  else
	    parentparent->_right = child;
	  
	}
	else
	  _root = child;
	
	//fix subtree T2, if it exists
	if (t2temp != NULL)
	  t2temp->_parent = parent;		
	
	
      }
	  
    } //end _pivot
      
     
  
  
  
  
      /**
      *  Draw function declaration
      * (You can ignore this one!)
      */
    void draw(string name, Iterator* iter=0, bool pause=false);
};


// The code after here is for drawing a representation of the tree using GraphViz.  It
// is not needed for use of the class.
#include <fstream>
#include <list>
#include <set>
#include <iostream>

template<typename ItemType> void BinaryTree<ItemType>::draw(string name, Iterator* iter, bool pause) {
  ofstream out((name + ".dot").c_str());
  out << "digraph {" << endl;

  out << "root [label=\"_root\"];" << endl;
  if (_size > 0) {
    // Follow all possible links and expand each node once
    // This will work even if some of the links are messed up.
    set<Node *> expanded;
    list<Node *> toExpand;
    toExpand.push_back(_root);
    while (!toExpand.empty()) {
      Node *current = toExpand.front();
      toExpand.pop_front();
      if (expanded.find(current) == expanded.end()) {
        expanded.insert(current);
        if (current->_parent != 0)
          toExpand.push_back(current->_parent);
        if (current->_left != 0)
          toExpand.push_back(current->_left);
        if (current->_right != 0)
          toExpand.push_back(current->_right);
      }
    }

    // Draw labels
    out << "root -> node" << _root << ";" << endl;
    typename set<Node *>::iterator nodes;
    for (nodes=expanded.begin(); nodes!=expanded.end(); ++nodes) {
      out << "node" << *nodes << " ";
      out << "[shape=record,label=\"{";
      out << "<parent> _parent | ";
      out << "_data = " << (*nodes)->_data << " | ";
      out << "_aux = " << (*nodes)->_aux << " | ";
      out << "{ <left> _left | <right> _right } }\"];" << endl;
    }

    // Draw links
    for (nodes=expanded.begin(); nodes!=expanded.end(); ++nodes) {
      if ((*nodes)->_parent)
        out << "node" << *nodes << ":parent:n -> node" << (*nodes)->_parent << ";" << endl;
      if ((*nodes)->_left)
        out << "node" << *nodes << ":left:s -> node" << (*nodes)->_left << ";" << endl;
      if ((*nodes)->_right)
        out << "node" << *nodes << ":right:s -> node" << (*nodes)->_right << ";" << endl;
    }

    if (iter != 0)
      out << "iter -> node" << (*iter)._current << ";" << endl;
  }
  else {
    out << "zero [shape=none, label=\"0\"];"  << endl;
    out << "root -> zero;" << endl;
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
    
