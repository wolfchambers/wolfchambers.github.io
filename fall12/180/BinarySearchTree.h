#include "BinaryTree.h"
#include <stdexcept>
using namespace std;

template <typename ItemType>
class BinarySearchTree : public BinaryTree<ItemType> {

private:
  
  /**
   * return an iterator to the parent of the position where value should go
   */
  typename BinaryTree<ItemType>::Iterator _lastValid(const ItemType& value) {
    typename BinaryTree<ItemType>::Iterator current = BinaryTree<ItemType>::root();
    
    bool done = false;
    while (!done) {
    
      if (value < *current) { //value is to the left
	if (current.hasLeftChild())
	  current = current.left();
	else
	  done = true;
      }
      
      else { //value is to the right
	if (current.hasRightChild())
	  current = current.right();
	else
	  done = true;
      }
      
    } //end while loop
    
    return current;
    
  } //end of _lastValid
  
public:
  
  /**
   * Function to insert an element into the BST
   * Input Parameter: the element to insert
   */
  void insert(const ItemType& element) {
   
    //if the tree is empty, use createRoot
    if (BinaryTree<ItemType>::empty())
      BinaryTree<ItemType>::createRoot(element);
    
    else { //need to find the correct spot
      typename BinaryTree<ItemType>::Iterator it = _lastValid(element);
      
      if (element < *it)
	BinaryTree<ItemType>::insertAsLeftChild(element, it);
      else
	BinaryTree<ItemType>::insertAsRightChild(element, it);

    } //end of else
    
  } //end of insert
  
  /** 
   * Function to find if an element is in the tree
   * Input Parameter: the element to search for
   * Return value: an iterator to the node if it is present, or a null iterator if not
   */
 typename BinaryTree<ItemType>::Iterator find(const ItemType& value) {
  
      	typename BinaryTree<ItemType>::Iterator current;
	current = BinaryTree<ItemType>::root(); 
    
	while (current != BinaryTree<ItemType>::end()) {
	  if (*current == value)
	    return current;
	  if (*current < value)
	    current = current.right();
	  else
	    current = current.left();
	} 
	return current;
    
  }
  
  /** 
   * Function to remove an element from the tree
   */
  void remove(const ItemType& element) {
     //hw
     typename BinaryTree<ItemType>::Iterator location;
          location=find(element);
 
	//case1: element is a leaf
	if (location.isLeaf()){
	  //since location is a leaf this is the same as recursivelyDelete function because the leaf does not have a right child to move up
	  BinaryTree<ItemType>::deleteAndMoveRightChildUp(location); 
	}//end case1
	
	//case2:element to be removed has left child only
	if (location.hasLeftChild() && !location.hasRightChild()){
	  //since location has only one child, it can be deleted and it's child can take its place
	  deleteAndMoveLeftChildUp(location); 
	}//end case2
	
	//case3: element to be removed has right child only
	if (!location.hasLeftChild() && location.hasRightChild()){
	    //since location has only one child, it can be deleted and it's child can take its place
	    deleteAndMoveRightChildUp(location);
	}//end case3
	
	//case4: element to be removed has two children
	if (location.hasLeftChild() && location.hasRightChild()){
	    typename BinaryTree<ItemType>::Iterator replacement = location;
	    replacement++;	//search for the next element in an inorder traversal
	    *location = *replacement;	 //replace the node to be deleted (location) with replacement
	    deleteAndMoveRightChildUp(replacement);  //if replacement has a subtree, reconnect it properly    
	}//end case4
	  
	
  }//end remove()

  
  }; // end BinarySearchTree.h