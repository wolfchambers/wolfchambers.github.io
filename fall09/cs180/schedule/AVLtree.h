template <typename Object>
class AVLTree {

protected:

  struct AVLNode {
	
	int height;
	Object value;
	AVLNode* parent;
	AVLNode* left;
	AVLNode* right;

	AVLNode(const Object& e = Object(), Node* p = 0, Node* l = 0, Node* r = 0, int h = 0) : element(e), parent(p), left(l), right(r), height(h) { }	
  }; //end of AVLNode struct

private:
	int size;
	AVLNode* root;

	//utility functions for copy constructor, destructor, etc.
	void clearRecurse(const Node* v) {
		if (v->left != 0) 
			clearRecurse(v->left);
		if (v->right != 0)
			clearRecurse(v->right);
		delete v;
	}

	Node* cloneRecurse(const Node* v) {
		Node* n = new Node(v->element);
		if (v->left != 0) {
			n->left = cloneRecurse(v->left);
			n->left->parent = n;
		}
		if (v->right != 0) {
			n->right = cloneRecurse(v->right);
			n->right->parent = n;
		}
		return n;
	}

public:

	//constructor
	AVLTree() : size(0), root(new AVLNode) { }

	//isEmpty
	bool isEmpty() {
		return size == 0
	}

	//getSize
	int getSize() {
		return size;
	}

	//insert obj into the tree, maintaining the height-balance property
	void insert(const Object& obj) {
		//write your code here
	}

	//delete a node containing obj from the tree if one exists; if obj is not in the tree, do nothing
	void delete(const Object& obj) {
		//write your code here
	}
	

	//search for an element in the tree, and return true if the node is in the tree and false if it is not
	bool find(const Object& obj) {
		return (finder(obj, root)->element) == obj;
	}

protected:
	//utility function to search for an element starting at a given pointer	
	//returns a pointer to the node storing obj or a pointer to the leaf node which would be a parent of obj if it were inserted
	AVLNode* finder(const Object& obj, AVLNode* current) {
		if (current->element == obj)
			return current;
		else if (current->element < obj)
			if (current->right ==NULL)
				return current;
			else 
				return finder(obj, current->right);
		else 
			if (current->left == NULL)
				return current;
			else 
				return finder(obj, current->left);
	}
	
public:

	//destructor
	~AVLTree() {
		clearRecurse(root);
	}

	//copy constructor
	AVLTree(const AVLTree& original) {
		size = original.size;
		root = original.cloneRecurse(original.root);
	}

	//overload the = operator
	AVLTree<Object>& operator=(const AVLTree& other) {
		if (this != &other) {
    			clearRecurse(root);
    			sz = other.size;
    			rt = cloneRecurse(other.root);
  		}
  		return *this;
	}

	//function to print the tree in an inorder traversal
	std::string inorder() const {
		std::stringstream treeList;
		if (root != NULL)
			temp = inorderWalk(root, treeList);
		return treeList.str();
	}

	std::stringstream inorderWalk(AVLNode* current, stringstream treeList) {
		if (current->left != NULL)
			inorderWalk(current->left, treeList);
		treeList << current->element << " ";
		if (current->right != NULL)
			inorderWalk(current->right, treeList);
		return treeList;
	}

};
