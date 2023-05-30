#include "BinarySearchTree.h"
#include <cmath>
#include <iostream>
using namespace std;

template <typename ItemType>
class AVLTree : public BinarySearchTree<ItemType> {
  
protected:
  
  /** function to set the height correctly **/
  void _setHeight(typename BinaryTree<ItemType>::Iterator position) {
    //assume child's heights are correct and in aux field 
    //get left child's height
    int leftheight = -1;
    if (position.hasLeftChild())
      leftheight = BinaryTree<ItemType>::getAux(position.left());
    //get right child's height
    int rightheight = -1;
    if (position.hasRightChild())
      rightheight = BinaryTree<ItemType>::getAux(position.right());
    
    BinaryTree<ItemType>::setAux(max(leftheight,rightheight)+1, position);
    
  }//end of _setHeight
  
  bool _isBalanced(typename BinaryTree<ItemType>::Iterator position) {
    int leftheight = -1;
    if (position.hasLeftChild())
      leftheight = BinaryTree<ItemType>::getAux(position.left());
    //get right child's height
    int rightheight = -1;
    if (position.hasRightChild())
      rightheight = BinaryTree<ItemType>::getAux(position.right());
    
    if (abs(rightheight - leftheight) < 2)
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

    _setHeight(it);
    cout << "set the height of the new node" << endl;
    
    it = it.up();
    cout << "moving up" << endl;

    while(!it.isNULL()) {
      _setHeight(it);
      
      //check if balanced, and pivot
      if (!_isBalanced(it)) {
	typename BinaryTree<ItemType>::Iterator z = it;
	typename BinaryTree<ItemType>::Iterator y = _getHigherChild(z);
	typename BinaryTree<ItemType>::Iterator x = _getHigherChild(y);
	
	if ((y == z.left() && x == y.left()) || (y == z.right() && x == y.right())) {
	  BinaryTree<ItemType>::pivot(y);
	  _setHeight(z);
	  _setHeight(y);
	  it = y;
	}
	else {
	  BinaryTree<ItemType>::pivot(x);
	  BinaryTree<ItemType>::pivot(x);
	  _setHeight(y);
	  _setHeight(z);
	  _setHeight(x);
	  it = x;
	}
      }
      
      it = it.up();
    }
    
  } //end insert

  void remove(const ItemType& value) {

  //homework?

  } //end remove
  
}; //end AVLTree class
