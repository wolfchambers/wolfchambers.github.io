#include "AVLTree.h"
#include <string>
#include <iostream>
using namespace std;


void printTree(AVLTree<int>& t) {
  cout << "inorder tree walk: " << t.inorder() << endl;;
}

void printHeight(AVLTree<int>& t) {
	cout << "The tree's height is: " << t.getHeight() << endl;
}
//---------------------------------------------------------------------------------





void testInsert() {
	AVLTree<int> mytree;

	mytree.insert(6);
	mytree.insert(12);
	mytree.insert(32);

	//tree should be 6 12 32
	cout << "mytree is: "; printTree(mytree);
	//height should be 2
	cout << "height is: "; printHeight(mytree);
	
	mytree.insert(2);
	mytree.insert(-3);

	//tree should be -3 2 6 12 32
	cout << "mytree is: "; printTree(mytree);
	//height should be 3
	cout << "height is: "; printHeight(mytree);

	mytree.insert(31);

	//tree should be -3 2 6 12 31 32
	cout << "mytree is: "; printTree(mytree);
	//height should be 3
	cout << "height is: "; printHeight(mytree);

	//inserting an element a second time shouldn't change the tree!
	mytree.insert(31);

	//tree should be -3 2 6 12 31 32
	cout << "mytree is: "; printTree(mytree);
	//height should be 3
	cout << "height is: "; printHeight(mytree);

	mytree.insert(8);

	//tree should be -3 2 6 8 12 31 32
	cout << "mytree is: "; printTree(mytree);
	//height should be 4
	cout << "height is: "; printHeight(mytree);

	mytree.insert(9);

	//tree should be -3 2 6 8 9 12 31 32
	cout << "mytree is: "; printTree(mytree);
	//height should be 4
	cout << "height is: "; printHeight(mytree);

	mytree.insert(1);
	mytree.insert(7);

	//tree should be -3 1 2 6 7 8 9 12 31 32
	cout << "mytree is: "; printTree(mytree);
	//height should be 4
	cout << "height is: "; printHeight(mytree);
} 


int main() {
  testInsert();
}
