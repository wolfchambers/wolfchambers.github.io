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
  
  
  cout << "test pivot: right child with 1 child inside tree" << endl;
  mytree.draw("tree",&it, true);
  mytree.pivot(it);
  mytree.draw("tree",&it, true);
  
  cout << "test pivot: left child with 2 children? (check)" << endl;
  it = mytree.root();
  it = it.left();
  it = it.left();
  mytree.draw("tree",&it, true);
  mytree.pivot(it);
  mytree.draw("tree",&it, true);

  cout << "test pivot on child of root" << endl;
  it = mytree.root();
  it = it.right();
  mytree.draw("tree",&it, true);
  mytree.pivot(it);
  mytree.draw("tree",&it, true);  

  cout << "test pivot on root: should give error" << endl;
  it = mytree.root();
  mytree.draw("tree",&it, true);
  mytree.pivot(it);
  mytree.draw("tree",&it, true); 

  
}
