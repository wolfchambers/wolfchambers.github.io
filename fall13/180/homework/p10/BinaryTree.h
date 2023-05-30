#include <string>
#include <iostream>
using namespace std;

/**
  Basic Binary Tree Class
**/
template <typename ItemType>
class BinaryTree {

  protected:

    /**
    * Internal structure to hold node data
    **/
    struct Node {
      ItemType _data; 	//The primary data in the node
      
      Node* _parent;	//pointer to parent node
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
	Iterator(Node* c = NULL, BinaryTree* t = NULL) : _current(c), _tree(t) {}
	
	//copy constructor
	Iterator(const Iterator& other) : _current(other._current), _tree(other._tree) {}
	
	//returns const reference to data
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
	
	//Returns iterator to next node in inorder traversal - it++
	Iterator operator++() {
	  
	  //If there is a right child, go right, then left as much as possible
	  if (hasRightChild()) {
	    *this = right();
	    //_current = _current->_right;
	    while (hasLeftChild())
	      *this = left();
	  }
	  else { //go up as long as we're the right child, then up one more
	    while (!isRoot() && (up().right() == *this)) 
	      *this = up();
	    *this = up();
	  }
	  return *this;
	}

	Iterator operator++(int dummy) {
	  Iterator temp = *this;
          if (hasRightChild()) {
            *this = right();
            while (hasLeftChild())
              *this = left();
          }
          else { 
            while (!isRoot() && (up().right() == *this)) 
              *this = up();
            *this = up();
          }
	  return temp;
	}

	
	//Returns true if the iterator points to the root
	bool isRoot() {
	  return (_current == _tree->_root);
	}
	
	//Returns true if the iterator points to a leaf node
	bool isLeaf() {
	  return (_current->_left == NULL) && (_current->_right == NULL);
	}
	
	//Returns true if the iterators point to the same thing
	bool operator==(const Iterator& other) {
	  return (_current == other._current) && (_tree == other._tree);
	}
	  
	//Returns true if the 2 iterators are NOT equal
	bool operator!=(const Iterator& other) {
	  return (_current != other._current) || (_tree != other._tree);
	}
	  
	//Returns true if the iterator has a left child
	bool hasLeftChild() {
	  return _current->_left != NULL;
	}
	
	//Returns true if the iterator has a right child
	 bool hasRightChild() {
	  return _current->_right != NULL;
	} 
	  
	friend class BinaryTree;
	  
    }; //end of iterator class
    
  private:
    
    Node* _root;
    int _size;
    
  protected:
    
    /** function to recursively delete a subtree 
     * Input parameter: node pointer indicated which subtree to remove
     **/
    void _recursivelyDelete(Node * node) {
      if (node != NULL) {
	_recursivelyDelete(node->_left);
	_recursivelyDelete(node->_right);
	delete node;
	_size--;
      }
    }
    
    /**function to recursively! duplicate a subtree
     * Input parameter: node pointer to subtree that should be copied
     * Return a pointer to the root of the duplicate tree
     **/
    Node* _duplicate(const Node* other) {
     
      //Base case
      if (other == NULL)
       return NULL;
     
      Node *newnode = new Node(other->_data, NULL, NULL, NULL);
      newnode->_left = _duplicate(other->_left);
      newnode->_right = _duplicate(other->_right);
      newnode->_left->_parent = newnode;
      newnode->_right->_parent = newnode;
      
      return newnode;
    }
    

    
    //swap current and its parent
    void _pivot(Iterator location) {
      
      //check if location is a left child
      if (location._current == location._current->_parent->_left) { 
	//it is a left child
	
	//create some extra variables for our own sanity
	Node* parent = location._current->_parent;
	Node* node = location._current;
	Node* parentsRight = parent->_right;
	Node* nodesRight = node->_right;
	Node* nodesLeft = node->_left;
	
	//put node where its parent is
	node->_parent = parent->_parent;
	//make sure parent isn't the root
	if (parent->_parent != NULL) {
	  if (parent->_parent->_left == parent) 
	    //parent is a left child
	    parent->_parent->_left = node;
	  else //parent is a right child
	    parent->_parent->_right = node;
	}
	else //parent is a root
	  _root = node;
	
	//make parent the nodes right child
	node->_right = parent;
	parent->_parent = node;
	
	//fix subtrees
	parent->_left = nodesRight;
	if (nodesRight != NULL)
	  nodesRight->_parent = parent;
      } //done with left child case
      
      else  { //node is a right child 
	
	//create sanity variables
	Node* node = location._current;
	Node* parent = node->_parent;
	Node* parentsLeft = parent->_left;
	Node* nodesLeft = node->_left;
	Node* nodesRight = node->_right;
	
	//put node where its parent is
	node->_parent = parent->_parent;	
	//make sure parent isn't the root
	if (parent->_parent != NULL) {
	  if (parent->_parent->_left == parent) 
	    //parent is a left child
	    parent->_parent->_left = node;
	  else //parent is a right child
	    parent->_parent->_right = node;
	}
	else //parent is a root
	  _root = node;
	
	//fix parent/node relationship
	node->_left = parent;
	parent->_parent = node;
	
	//reattach subtrees
	parent->_right = nodesLeft;
	if (nodesLeft != NULL)
	  nodesLeft->_parent = parent;
	
      } //end right child case
	  
    } //end _pivot
      
  public:  

    /** 
     * Constructor
     **/
    BinaryTree() : _root(0), _size(0) {}
    
    /**
    *  Copy Constructor
    */
    BinaryTree(const BinaryTree& other) {
      _root = _duplicate(other._root);
      _size = other._size;
    }
    
    /**
     * Destructor
     **/
    ~BinaryTree() {
      _recursivelyDelete(_root);
    }

    /**
      *  Returns size of the tree
      */
    unsigned int size() const {
      return _size;
    }

    /**
      *  Returns true if the tree is empty
      */
    bool empty() const {
      return _size == 0;
    }

     int getAuxiliary(Iterator iter) {
      return iter._current->_aux;
    }

    void setAuxiliary(Iterator iter, int v) {
      iter._current->_aux = v;
    }   
    
    void createRoot(const ItemType& value) {
      _root = new Node(value);
      _size = 1;
    }
    


    /** function to insert new data as left child
     * if left child already exists, it gets deleted
     * Input parameters: 
    **/
    void insertAsLeftChild(Iterator location, const ItemType& data) {
      _recursivelyDelete(location._current->_left);
      location._current->_left = new Node(data, location._current);
      _size++;
    }
    
    /** function to insert new data as right child
     * if right child already exists, it gets deleted
     * Input parameters: 
    **/
    void insertAsRightChild(Iterator location, const ItemType& data) {
      _recursivelyDelete(location._current->_right);
      location._current->_right = new Node(data, location._current);
      _size++;
    }    
    
    /**
     *  Delete a node from the tree advancing its left child.
     *
     *  The left child of the node will take the place of the specified
     *  node.  The node and its right subtree will be deleted.
     *
     *  Input parameter location: an iterator referencing the node to be deleted.
     */
    void deleteAndMoveLeftChildUp(Iterator location) {
      _recursivelyDelete(location._current->_right);

      // If theres a left child make its parent the one above this one
      if (location._current->_left != 0)
        location._current->_left->_parent = location._current->_parent;

      // If this nodes has a parent (not the root) have it point to the left child
      if (location._current->_parent != 0) {
        if (location._current->_parent->_left == location._current) // It's the left child
          location._current->_parent->_left = location._current->_left;
        else // It's the right child
          location._current->_parent->_right = location._current->_left;
      }
      else {  // The current node is the root
        _root = location._current->_left;
      }

      // Delete the node
      delete location._current;
      _size--;
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


    
    /**
      *  Function to return iterator to the leftmost element in the tree
      */
    Iterator begin() {
      Node* current = _root;
      while(current->_left != NULL)
	current = current->_left;
      return Iterator(current, this);
    }


    /**  
     *  Function to return an iterator to the "end" of the tree
    */  
    Iterator end() {
      return Iterator(NULL, this);
    }

    /**
      *  Funciton that returns an iterator to the root
      */
    Iterator root() {
      return Iterator(_root, this);
    }

    /**
      *  Function to empty a tree 
      */
    void clear() {
      _recursivelyDelete(_root);
      _size = 0;
      _root = NULL;
    }    
    
    /**
      *  
      */
    void test() {
      _root = new Node(0);
      Node *left = new Node(1);
      Node *right = new Node(2);
      Node *leftleft = new Node(3);
      Node *leftright = new Node(4);
      _size = 5;

      _root->_left = left; left->_parent = _root;
      _root->_right = right; right->_parent = _root;
      left->_left = leftleft; leftleft->_parent = left;
      left->_right = leftright; leftright->_parent = left;

      draw("test", 0, true);
      Iterator iter(leftright, this);
      draw("test", &iter, true);
      
      //fix - now iterators!
//      _insertAsRightChild(leftright, 100);
      draw("test", &iter, true);
//      _insertAsRightChild(leftright, 99);
      draw("test", &iter, true);
    }

    /**
      *  \brief
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
