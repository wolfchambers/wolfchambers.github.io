#include "AVLTree.h"
#include <iostream>
using namespace std;

int main() {
  AVLTree<int> mytree;
  
  mytree.insert(12);
  mytree.draw("testAVL", 0, true);
  mytree.insert(15);
  mytree.draw("testAVL", 0, true);
  mytree.insert(20);
  mytree.draw("testAVL", 0, true);
  mytree.insert(9);
  mytree.draw("testAVL", 0, true);
  mytree.insert(11);
  mytree.draw("testAVL", 0, true);
  mytree.insert(5);
  mytree.draw("testAVL", 0, true);
  
}