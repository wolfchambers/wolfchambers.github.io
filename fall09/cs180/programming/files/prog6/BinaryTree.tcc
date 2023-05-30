/*
 * Default Constructor:  creates an empty tree
 */
template <typename Object>
BinaryTree<Object>::BinaryTree() : sz(1) {
  rt   = new Node;
}



/*
 * Copy Constructor
 */
template <typename Object>
BinaryTree<Object>::BinaryTree(const BinaryTree<Object>& orig) { 
  sz = orig.sz;
  rt = cloneRecurse(orig,orig.rt);
}

/*
 * Overloaded Assignment Operator
 */
template <typename Object>
BinaryTree<Object>& BinaryTree<Object>::operator=(const BinaryTree<Object>& orig) {
  if (this != &orig) {
    clearRecurse(rt);
    sz = orig.sz;
    rt = cloneRecurse(orig,orig.rt);
  }
  return *this;
}

/*
 * Destructor
 */
template <typename Object>
BinaryTree<Object>::~BinaryTree() {
  clearRecurse(rt);
}


  /****************************** query methods ****************************/


/*
 * returns size of tree
 */
template <typename Object>
int BinaryTree<Object>::size() const {
  return sz;
}




/*
 * does position correspond to internal node?
 */
template <typename Object>
bool BinaryTree<Object>::isInternal(const Position& p) const throw(InvalidPositionException) {
  NodePtr v = p.validate(this);
  return v->left != NULL;
}

/*
 * does position correspond to external node?
 */
template <typename Object>
bool BinaryTree<Object>::isExternal(const Position& p) const throw(InvalidPositionException) {
  NodePtr v = p.validate(this);
  return v->left == NULL;
}

/*
 * is this the root position?
 */
template <typename Object>
bool BinaryTree<Object>::isRoot(const Position& p) const throw(InvalidPositionException) {
  NodePtr v = p.validate(this);
  return v == rt;
}


/****************************** accessor methods ****************************/


/*
 * return position of root of tree
 */
template <typename Object>
typename BinaryTree<Object>::Position BinaryTree<Object>::root() const {
  return Position(rt);
}


/*
 * return position of parent of given position
 */
template <typename Object>
typename BinaryTree<Object>::Position BinaryTree<Object>::parent(const Position& p) const
  throw(BoundaryViolationException, InvalidPositionException) {
  NodePtr v = p.validate(this);
  if (v==rt) throw BoundaryViolationException("Cannot traverse parent of root");
  return Position(v->parent);
}


/*
 * return position of left child of given position
 */
template <typename Object>
typename BinaryTree<Object>::Position BinaryTree<Object>::leftChild(const Position& p) const
  throw(BoundaryViolationException, InvalidPositionException) {
  NodePtr v = p.validate(this);
  if (v->left==NULL) throw BoundaryViolationException("Cannot traverse child of external position");
  return Position(v->left);
}


/*
 * return position of right child of given position
 */
template <typename Object>
typename BinaryTree<Object>::Position BinaryTree<Object>::rightChild(const Position& p) const
  throw(BoundaryViolationException, InvalidPositionException) {
  NodePtr v = p.validate(this);
  if (v->right==NULL) throw BoundaryViolationException("Cannot traverse child of external position");
  return Position(v->right);
}


/*
 * return position of sibling of given position
 */
template <typename Object>
typename BinaryTree<Object>::Position BinaryTree<Object>::sibling(const Position& p) const
  throw(BoundaryViolationException, InvalidPositionException) {
  NodePtr v = p.validate(this);
  if (v==rt) throw BoundaryViolationException("Cannot traverse sibling of root");
  NodePtr parent = v->parent;
  NodePtr lc = parent->left;
  NodePtr s = (v==lc ? parent->right : lc);
  return Position(s);
}



/*
 * return iterator of all children of given position
 */
template <typename Object>
typename BinaryTree<Object>::PositionalIterator BinaryTree<Object>::children(const Position& p) const
  throw(InvalidPositionException) {
  NodePtr v = p.validate(this);
  PositionalIterator PI;

  if (v->left!=NULL) {
    PI.items.push_back(Position(v->left));
    PI.items.push_back(Position(v->right));
  }
  
  return PI;
}



/*
 * return iterator of all children of given position
 */
template <typename Object>
typename BinaryTree<Object>::PositionalIterator BinaryTree<Object>::positions() const {
  PositionalIterator PI;
  recurseAdd(PI,rt);
  return PI;
}


template <typename Object>
void BinaryTree<Object>::recurseAdd(PositionalIterator &pi, const NodePtr v) const {
  if (v->left!=NULL) recurseAdd(pi,v->left);
  pi.items.push_back(Position(v));
  if (v->right!=NULL) recurseAdd(pi,v->right);
}


/*
 * return iterator of all elements stored in the tree
 */
template <typename Object>
typename BinaryTree<Object>::ObjectIterator BinaryTree<Object>::elements() const {
  ObjectIterator OI;
  recurseAdd(OI,rt);
  return OI;
}


template <typename Object>
void BinaryTree<Object>::recurseAdd(ObjectIterator &oi, const NodePtr v) const {
  if (v->left!=NULL) recurseAdd(oi,v->left);
  oi.items.push_back(v->element);
  if (v->right!=NULL) recurseAdd(oi,v->right);
}




/*
 * replace the element at the given position
 */
template <typename Object>
void BinaryTree<Object>::replaceElement(const Position& p, const Object& element)
  throw(InvalidPositionException) {
    NodePtr v  = p.validate(this);
    v->element = element;
}


/*
 * swap the elements stored at the given positions
 */
template <typename Object>
void BinaryTree<Object>::swapElements(const Position& p, const Position& q)
  throw(InvalidPositionException) {
    NodePtr v  = p.validate(this);
    NodePtr w  = q.validate(this);
    Object e = v->element;
    v->element = w->element;
    w->element = e;
}


/*
 * Converts external position into an internal node with two newly
 * created external children (each of which have default element)
 */
template <typename Object>
void BinaryTree<Object>::expandExternal(const Position& p)
  throw(InvalidPositionException, BoundaryViolationException) {
    NodePtr v  = p.validate(this);
    if (v->left==NULL) {	
      v->left = new Node(Object(),v,NULL,NULL);
      v->right = new Node(Object(),v,NULL,NULL);
      sz+=2;
    } else {
      throw BoundaryViolationException("Cannot expand internal node");
    }
}


/*
 * Replaces the external position p with a subtree which mirrors the
 * contents of a second tree T2.
 *
 *  Note well: the external node as well as the second tree itself are
 *  destroyed as a side effect.
 */
template <typename Object>
void BinaryTree<Object>::replaceExternalWithSubtree(const Position& p, BinaryTree<Object>& T2)
  throw(InvalidPositionException, BoundaryViolationException) {
    NodePtr v  = p.validate(this);
    if (v->left==NULL) {
      sz+=T2.sz-1;
      if (v==rt) {
	rt = T2.rt;
      } else {
	NodePtr parent = v->parent;
	T2.rt->parent = parent;
	if (v==parent->left)
	  parent->left = T2.rt;
	else
	  parent->right = T2.rt;
      }

      // deallocate original external node
      delete v;

      // convert T2 back to a default tree (in a way so that its
      // original nodes are not destroyed, as they are now part of
      // this tree)
      T2.sz = 1;
      T2.rt = new Node;
    } else {
      throw BoundaryViolationException("Cannot replace internal node");
    }
}



/*
 * Takes an external position w of tree, deletes w and the parent of
 * w from the tree, promoting the sibling of w into the parent's
 * place (see Figure 6.13)
 */
template <typename Object>
typename BinaryTree<Object>::Position BinaryTree<Object>::removeAboveExternal(const Position& w)
  throw(InvalidPositionException, BoundaryViolationException) {
    NodePtr v  = w.validate(this);
    if (v==rt)
      throw BoundaryViolationException("Cannot use replaceAboveExternal on root");

    if (v->left!=NULL)
      throw BoundaryViolationException("Cannot use replaceAboveExternal on internal node");

    NodePtr parent = v->parent;
    NodePtr s = sibling(w).node;
    if (isRoot(parent))
      rt = s;
    else {
      NodePtr grand = parent->parent;
      if (parent==grand->left)
	grand->left = s;
      else
	grand->right = s;
      s->parent = grand;
    }
    sz-=2;
    delete parent;
    delete v;
    return Position(s);
}







/*
 * clears existing tree
 */
template <typename Object>
void BinaryTree<Object>::clearRecurse(const NodePtr v) {
  if (v!=NULL) {
    if (v->left!=NULL) {
      clearRecurse(v->left);
      clearRecurse(v->right);
    }
    delete v;
  }
}


/*
 * clones an existing tree
 */
template <typename Object>
typename BinaryTree<Object>::NodePtr BinaryTree<Object>::cloneRecurse(const BinaryTree<Object>& orig, const NodePtr v) {
  NodePtr n = new Node(v->element);
  if (v->left!=NULL) {
    n->left = cloneRecurse(orig,v->left);
    n->left->parent = n;
    n->right = cloneRecurse(orig,v->right);
    n->right->parent = n;
  }
  return n;
}


/*******************************************************
 * Position methods
 *******************************************************/

/**
 * utility to convert Position to node pointer
 */
template <typename Object>
typename BinaryTree<Object>::NodePtr
     BinaryTree<Object>::Position::validate(const BinaryTree<Object>* tree) const
  throw(InvalidPositionException) {
  if (node == NULL)
    throw InvalidPositionException("Cannot use a NULL position");
  if (node!=tree->rt && node->parent==NULL)
    throw InvalidPositionException("Position appears to involve an item which has since been removed from the tree.");
  else return node;
}


/*******************************************************
 * Iterator methods
 *******************************************************/
template<typename Object>
template<typename T>
BinaryTree<Object>::Iterator<T>::Iterator() : index(0) { };

template<typename Object>
template<typename T>
bool BinaryTree<Object>::Iterator<T>::hasNext() {
     return (index < items.size());
}

template<typename Object>
template<typename T>
T BinaryTree<Object>::Iterator<T>::next() {
  return items[index++];
}

