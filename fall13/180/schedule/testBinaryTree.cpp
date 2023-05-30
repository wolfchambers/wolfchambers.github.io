#include "BinaryTree.h"
#include <iostream>
using namespace std;

int main() {

  BinaryTree<int> mytree;
  mytree.createRoot(12);
  
  BinaryTree<int>::Iterator it = mytree.root();
  mytree.draw("tree",0,true);
  
  mytree.insertAsLeftChild(5, it);
  mytree.insertAsRightChild(22, it);
  it = it.left();
  mytree.insertAsLeftChild(1, it);
  mytree.insertAsRightChild(9, it);
  
  mytree.draw("tree",&it,true);
  
  //test recursively delete
  it = it.left();
  mytree.deleteAndMoveLeftChildUp(it);
  
  //print tree
  cout << "past delete" << endl;
  mytree.draw("tree",0,true);

  //will need to test pivot
  
}
