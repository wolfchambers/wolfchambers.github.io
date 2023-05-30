#include "BinarySearchTree.h"
#include <cmath>
using namespace std;


template <typename ItemType>
class AVLTree: public BinarySearchTree<ItemType> {
  
    protected:
    
    bool _isBalanced(typename BinaryTree<ItemType>::Iterator position) {
      int leftChildHeight, rightChildHeight, balanceFactor;
      
      //get left child's height
      if (position.hasLeftChild())
	leftChildHeight = BinaryTree<ItemType>::_getAuxiliary(position.left());
      else
	leftChildHeight = -1;
      
      //get right child's height
      if (position.hasRightChild())
	rightChildHeight = BinaryTree<ItemType>::_getAuxiliary(position.right());
      else
	rightChildHeight = -1;
      
      balanceFactor = rightChildHeight - leftChildHeight;
      
      return ((-1 <= balanceFactor) && (balanceFactor <= 1));
    }
    
    void _setHeight(typename BinaryTree<ItemType>::Iterator position) {
      int leftChildHeight, rightChildHeight, newHeight;
      
      //get left child's height
      if (position.hasLeftChild())
	leftChildHeight = BinaryTree<ItemType>::_getAuxiliary(position.left());
      else
	leftChildHeight = -1;
      
      //get right child's height
      if (position.hasRightChild())
	rightChildHeight = BinaryTree<ItemType>::_getAuxiliary(position.right());
      else
	rightChildHeight = -1;
      
      if (rightChildHeight >= leftChildHeight)
	newHeight = rightChildHeight + 1;
      else
	newHeight = leftChildHeight + 1;
      
      _setAuxiliary(position, newHeight);
    }
  
  public:
    
    void insert(const ItemType& value) {
      
      cout << "inserting " << value << endl;
      
      //check if the new value should be the root
      if (BinaryTree<ItemType>::empty()) {
	_createRoot(value);
	_setHeight(BinaryTree<ItemType>::root());
      }
      
      //it shouldn't be the root
      else {
	
	//insert the new value
	typename BinaryTree<ItemType>::Iterator current = BinaryTree<ItemType>::root();
	typename BinaryTree<ItemType>::Iterator parent, grandparent;
	typename BinaryTree<ItemType>::Iterator x,y,z;
	
	bool done = false;
	
	
	while (!done) {
	  if (*current <= value) {
	    if (current.hasRightChild())
	      current = current.right();
	    else {
	      _insertAsRightChild(current, value);
	      _setHeight(current.right());
	      current = current.right();
	      done = true;
	    }
	  }
	  else //going left
	    if (current.hasLeftChild())
	      current = current.left();
	    else {
	      _insertAsLeftChild(current, value);
	      _setHeight(current.left());
	      current = current.left();
	      done = true;
	    }
	}

	
	//fix balance factors and rotate
	parent = current.up();
	_setHeight(parent);
	
	z = parent.up();
	y = parent;
	x = current;
	
	while (z != BinaryTree<ItemType>::root().up()) {

	    // determine x and y, and reset heights
	    _setHeight(z);
	    
	    if (!_isBalanced(z)) {
	      
	      if (y == z.left() && x == y.left()) {
		BinaryTree<ItemType>::_pivot(y);
		_setHeight(z);
		_setHeight(y);
		z=y;
	      }
	      
	      if (y == z.left() && x == y.right()) {
		BinaryTree<ItemType>::_pivot(x);
		BinaryTree<ItemType>::_pivot(x);
		_setHeight(y);
		_setHeight(z);
		_setHeight(x);
		z = x;
	      }
	      
	      if (y == z.right() && x == y.left()) {
		BinaryTree<ItemType>::_pivot(x);
		BinaryTree<ItemType>::_pivot(x);
		_setHeight(y);
		_setHeight(z);
		_setHeight(x);
		z=x;
	      }
	      
	      if (y == z.right() && x == y.right()) {
		BinaryTree<ItemType>::_pivot(y);
		_setHeight(z);
		_setHeight(y);
		z=y;
	      }
		
	    } //end if !z.isBalanced()
	  
	    //reset z
	    x = y;
	    y = z;
	    z = z.up();
	    
	  } //end while 
      }
      
    } //end insert
    
    void remove(const ItemType& value) {
      //Program 5
    }
    

};