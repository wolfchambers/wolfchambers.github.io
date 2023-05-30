#include "BinaryTree.h"
#include <iostream>
using namespace std;

int main() {

  BinaryTree<int> mytree;
  mytree.createRoot(12);
  
  BinaryTree<int>::Iterator it = mytree.root();
  mytree.draw("tree",&it,true);
  
  mytree.insertAsLeftChild(5, it);
  mytree.insertAsRightChild(22, it);
  it = it.left();
  mytree.insertAsLeftChild(1, it);
  mytree.insertAsRightChild(9, it);
  it = mytree.root();
  it = it.right();
  mytree.insertAsRightChild(25, it);
  
  mytree.draw("tree",&it,true);
  
  
  //test pivot
  mytree.draw("tree",&it, true);
  mytree.pivot(it);
  mytree.draw("tree",&it, true);
  
}
