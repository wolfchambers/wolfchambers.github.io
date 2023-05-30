#include "BinarySearchTree.h"
#include <cmath>
#include <iostream>
using namespace std;

template <typename ItemType>
class AVLTree : public BinarySearchTree<ItemType> {
  
protected:
  
  /** function to set the height correctly **/
  void _setHeight(typename BinaryTree<ItemType>::Iterator position) {
    //get left child's height
    int leftheight = -1;
    if (position.hasLeftChild())
      leftheight = BinaryTree<ItemType>::getAux(position.left());
    //get left child's height
    int rightheight = -1;
    if (position.hasRightChild())
      rightheight = BinaryTree<ItemType>::getAux(position.right()); 
    //update position's height
    BinaryTree<ItemType>::setAux(max(leftheight,rightheight)+1, position);
  }//end of _setHeight
  
  bool _isBalanced(typename BinaryTree<ItemType>::Iterator position) {
    //get left child's height
    int leftheight = -1;
    if (position.hasLeftChild())
      leftheight = BinaryTree<ItemType>::getAux(position.left());
    //get left child's height
    int rightheight = -1;
    if (position.hasRightChild())
      rightheight = BinaryTree<ItemType>::getAux(position.right()); 
    
    if (abs(leftheight-rightheight) <= 1)
      return true;
    else
      return false;
    
  }
  
  typename BinaryTree<ItemType>::Iterator _getHigherChild(typename BinaryTree<ItemType>::Iterator position) {
    //get left child's height
    int leftheight = -1;
    if (position.hasLeftChild())
      leftheight = BinaryTree<ItemType>::getAux(position.left());
    //get left child's height
    int rightheight = -1;
    if (position.hasRightChild())
      rightheight = BinaryTree<ItemType>::getAux(position.right()); 
    
    if (leftheight > rightheight)
      return position.left();
    else
      return position.right();
  }
  
public:
  
  void insert(const ItemType& value) {
    //call BinarySearchTree insert to put new node in first
    typename BinaryTree<ItemType>::Iterator it = BinarySearchTree<ItemType>::insert(value);
    
    cout << "past binary search tree insert" << endl;
    
    //fix heights and check if unbalanced
    it = it.up();
    while (!it.isNULL()) {
      //cout << "set height" << endl;
      //fix this node's height
      _setHeight(it);
      
      if (!_isBalanced(it)) {
	typename BinaryTree<ItemType>::Iterator z = it;
	typename BinaryTree<ItemType>::Iterator y = _getHigherChild(z);
	typename BinaryTree<ItemType>::Iterator x = _getHigherChild(y);
	
	//detect which pivots to do
	if (((z.left() == y) && (y.left() == x)) || ((z.right() == y) && (y.right() == x))) {
	  //need to pivot y once
	  BinaryTree<ItemType>::pivot(y);
	  _setHeight(x);
	  _setHeight(z);
	  _setHeight(y);
	  it = y.up();
	}
	else {
	  BinaryTree<ItemType>::pivot(x);
	  BinaryTree<ItemType>::pivot(x);
	  _setHeight(z);
	  _setHeight(y);
	  _setHeight(x);
	  it = x.up();
	}
      } //end if not balanced
      else 
	it = it.up();
    } //end of while
    
  } //end insert

  void remove(const ItemType& value) {

  //homework

  } //end remove
  
}; //end AVLTree class
