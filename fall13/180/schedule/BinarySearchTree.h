#include "BinaryTree.h"
using namespace std;

template <typename ItemType>
class BinarySearchTree : public BinaryTree<ItemType> {
  
public:
  
  /**
   * Function to insert an element into the BST
   * Input Parameter: the element to insert
   * Return value: the position of the new node
   */
  typename BinaryTree<ItemType>::Iterator insert(const ItemType& element) {
    
    //check if tree is empty and put new element as root, if so
    if (BinaryTree<ItemType>::empty()) {
      BinaryTree<ItemType>::createRoot(element);
      return BinaryTree<ItemType>::root();
    }
    else {
      //Find position where the new value should go in current tree
      typename BinaryTree<ItemType>::Iterator position = BinaryTree<ItemType>::root(); 
      while (true) {
	if (*position < element) {
	  if (position.hasRightChild()) 
	    position = position.right();
	  else
	    break;
	}
	else {
	 if (position.hasLeftChild()) 
	   position = position.left();
	 else 
	   break;
	}
      }

      //Insert the new node - just below position
      if (element <= *position) {
	BinaryTree<ItemType>::insertAsLeftChild(element, position);
	position = position.left();
      }
      else {
	BinaryTree<ItemType>::insertAsRightChild(element, position);
	position = position.right();
      }
      return position;

    }
    
  } //end of insert
  
  /** 
   * Function to find if an element is in the tree
   * Input Parameter: the element to search for
   * Return value: a boolean which is true if the element is in the tree
   */
  bool find(const ItemType& value) {
    
    //make an iterator for root
    typename BinaryTree<ItemType>::Iterator position = BinaryTree<ItemType>::root();
    
    while (!position.isNULL()) {
      if (*position == value) {
	return true;
      }
      else {
	if (*position > value)
	  position = position.left();
	else
	  position = position.right();
      }
    } //ends while
    
    return false;
  } //end of find
  
  /** 
   * Function to remove an element from the tree
   */
  void remove(const ItemType& element) {
    //homework!

  }
  
  
}; // end BinarySearchTree.h
