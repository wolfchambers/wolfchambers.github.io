#include "BinarySearchTree.h"
#include <cmath>
using namespace std;

template <typename ItemType>
class AVLTree : public BinarySearchTree<ItemType> {
  
protected:
  
  /** function to set the height correctly **/
  void _setHeight(typename BinaryTree<ItemType>::Iterator position) {
    
    int leftheight = -1; 
    int rightheight = -1;
    
    //get left child's height
    if (position.hasLeftChild())
      leftheight = BinaryTree<ItemType>::getAuxiliary(position.left());

    //get right child's height
    if (position.hasRightChild())
      rightheight = BinaryTree<ItemType>::getAuxiliary(position.right());
    
    //set position's height
    if (leftheight > rightheight)
      BinaryTree<ItemType>::setAuxiliary(leftheight+1, position);
    else
      BinaryTree<ItemType>::setAuxiliary(rightheight+1, position);
     
  }
  
  bool _isBalanced(typename BinaryTree<ItemType>::Iterator position) {
    
    int leftheight = -1; 
    int rightheight = -1;
    
    //get left child's height
    if (position.hasLeftChild())
      leftheight = BinaryTree<ItemType>::getAuxiliary(position.left());

    //get right child's height
    if (position.hasRightChild())
      rightheight = BinaryTree<ItemType>::getAuxiliary(position.right());
    
    int balancefactor = abs(leftheight-rightheight);
    return (balancefactor <= 1);
    
  }
  
  typename BinaryTree<ItemType>::Iterator _getHigherChild(typename BinaryTree<ItemType>::Iterator position) {
    
    if (position.hasLeftChild() && !position.hasRightChild())
      return position.left();
    else 
      if (position.hasRightChild() &&  !position.hasLeftChild())
	return position.right();
      else {
	
	//know there is both a left and right child
	if (BinaryTree<ItemType>::getAuxiliary(position.right()) > BinaryTree<ItemType>::getAuxiliary(position.left()))
	  return position.right();
	else 
	  return position.left();
      }
    
  }
  
public:
  
  void insert(const ItemType& value) {
    
    //insert the value into the tree
    BinarySearchTree<ItemType>::insert(value);
    
    typename BinaryTree<ItemType>::Iterator current, parent, grandparent, x,y,z;
    
    //set correct height of new node
    current = BinarySearchTree<ItemType>::find(value);
    _setHeight(current);
    
    //check and fix the rest of the tree if not at the root
    if (!current.isRoot()) {
      //check parent's height
      parent = current.up();
      _setHeight(parent);
      
      while (!parent.isRoot()) {
	grandparent = parent.up();
	_setHeight(grandparent);
	
	//check to see if we need a rotation
	if (!_isBalanced(grandparent)) {
	  z = grandparent;
	  y = _getHigherChild(z);
	  x = _getHigherChild(y);
	  
	  if ((y == z.left() && x == y.left()) || (y == z.right() && x == y.right())) {
	    pivot(y);
	    _setHeight(z);
	    _setHeight(y);
	    grandparent = y;
	  }
	  else {
	    pivot(x);
	    pivot(x);
	    _setHeight(y);
	    _setHeight(z);
	    _setHeight(x);
	    grandparent = x;
	  }
	  
	} //end of !isBalanced
	
	//update parent and continue the loop
	parent = grandparent;
	
      } //end of while
    
    } //end of if
    
    
  } //end insert
  
}; //end AVLTree class