#ifndef BINARY_TREE_H
#define BINARY_TREE_H

#include <vector>
#include "VariousExceptions.h"

template <typename Object>
class BinaryTree {

public:
  /*
   * Default Constructor: creates a tree with single node (which contains default element)
   *
   */
  BinaryTree();

  /*
   * Copy Constructor
   *
   */
  BinaryTree(const BinaryTree& orig);

  /*
   * Overloaded Assignment Operator
   *
   */
  BinaryTree& operator=(const BinaryTree& orig);

  /*
   * Destructor
   *
   */
  ~BinaryTree();

private: 
  /********************************************************
   * Class Node:  this represents a single node of the tree
   */
  struct Node {						// node in the BinaryTree
    Object  element;					// element
    Node*   parent;					// parent node
    Node*   left;					// left child
    Node*   right;					// left child
    Node(const Object& e = Object(), Node* p = NULL, Node* l = NULL, Node* r = NULL)
      : element(e), parent(p), left(l), right(r) { }   	// constructor
  };
  typedef Node* NodePtr;				// pointer to a Node


public:
  /********************************************************
   * Class Position:  represents a position in a BinaryTree
   */
  class Position {
  public:
    /*
     * constructor
     */
    Position(NodePtr n = NULL) : node(n) { }

    /*
     * Returns the element at the Position
     */
    Object& element() const throw(InvalidPositionException) {
      if (node == NULL) throw InvalidPositionException("Null position");
      return node->element;
    }

    /*
     * Determines whether the Position is a 'null' position
     */
    bool isNull() const { return node == NULL; }

    /*
     * Overload the equality operator
     */
    bool operator==(const Position& other) {
      return (this->node == other.node);
    }

    /*
     * Overload the equality operator
     */
    bool operator!=(const Position& other) {
      return ! operator==(other);
    }

  private:
    friend class BinaryTree<Object>;  // allow access to private member
    NodePtr node;
    NodePtr validate(const BinaryTree<Object>* tree) const throw(InvalidPositionException);
  };
  /*********** end of class Position ***************************************/


  /**********************************************************************
   * Iterator Classes
   */
  template <typename T>
  class Iterator {
  public:
    /*
     * are there more items left in iteration?
     */
    bool hasNext();

    /*
     * Returns the next available item in the iteration
     */
    T next();

  private:
    friend class BinaryTree;
    Iterator();
    std::vector<T> items;  // vector of items
    unsigned int index;	   // current index
  };
  typedef Iterator<Position> PositionalIterator;
  typedef Iterator<Object> ObjectIterator;
  /**************** end of iterator classes ******************************/



  /****************************** query methods ****************************/

  /*
   * returns size of tree
   */
  int size() const;

  /*
   * does position correspond to internal node?
   */
  bool isInternal(const Position& p) const
    throw(InvalidPositionException);

  /*
   * does position correspond to external node?
   */
  bool isExternal(const Position& p) const
    throw(InvalidPositionException);


  /*
   * is this the root position?
   */
  bool isRoot(const Position& p) const
    throw(InvalidPositionException);


  /****************************** accessor methods ****************************/

  /*
   * return position of root of tree
   */
  Position root() const;


  /*
   * return position of parent of given position
   */
  Position parent(const Position& p) const
    throw(BoundaryViolationException, InvalidPositionException);


  /*
   * return position of left child of given position
   */
  Position leftChild(const Position& p) const
    throw(BoundaryViolationException, InvalidPositionException);


  /*
   * return position of right child of given position
   */
  Position rightChild(const Position& p) const
    throw(BoundaryViolationException, InvalidPositionException);


  /*
   * return position of sibling of given position
   */
  Position sibling(const Position& p) const
    throw(BoundaryViolationException, InvalidPositionException);


  /*
   * return iterator of all children of given position
   */
  PositionalIterator children(const Position& p) const
    throw(InvalidPositionException);


  /*
   * return iterator of all positions of the tree
   */
  PositionalIterator positions() const;


  /*
   * return iterator of all elements stored in the tree
   */
  ObjectIterator elements() const;




  /****************************** update methods ****************************/

  /*
   * replace the element at the given position
   */
  void replaceElement(const Position& p, const Object& element)
    throw(InvalidPositionException);

  /*
   * swap the elements stored at the given positions
   */
  void swapElements(const Position& p, const Position& q)
    throw(InvalidPositionException);

  /*
   * Converts external position into an internal node with two newly
   * created external children (each of which have default element)
   */
  void expandExternal(const Position& p)
    throw(InvalidPositionException,BoundaryViolationException);


  /*
   * Replaces the external position p with a subtree which mirrors the
   * contents of a second tree T2.  Existing positions of the second
   * tree remain valid in the result.
   *
   *  Note well: the external node as well as the second tree itself are
   *  destroyed as a side effect.
   */
  void replaceExternalWithSubtree(const Position& p, BinaryTree& T2)
    throw(InvalidPositionException,BoundaryViolationException);


  /*
   * Takes an external position w of tree, deletes w and the parent of
   * w from the tree, promoting the sibling of w into the parent's
   * place (see Figure 6.13)
   */
  Position removeAboveExternal(const Position& w)
    throw(InvalidPositionException,BoundaryViolationException);



private:
  int       sz;       // number of items
  NodePtr   rt;       // root of the tree

  /*
   * Utilities used for tree iterators
   */
  void recurseAdd(PositionalIterator &pi, const NodePtr v) const;
  void recurseAdd(ObjectIterator &oi, const NodePtr v) const;

  /*
   * Utilities used for copy constructor, assignment operator, and destructor
   */
  void clearRecurse(const NodePtr v);
  NodePtr cloneRecurse(const BinaryTree& orig, const NodePtr v);
};


#include "BinaryTree.tcc"

#endif
