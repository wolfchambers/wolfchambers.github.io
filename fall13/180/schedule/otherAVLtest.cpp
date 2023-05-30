//#include "BinaryTree.h"
#include "AVLTree.h"
#include <iostream>
using namespace std;

int main() {
  AVLTree<int> mytree;

  mytree.insert(20); mytree.insert(13); mytree.insert(30);
  mytree.draw("AVLtree",0,true);

  //triggers no rotation
  mytree.insert(24); mytree.insert(40);
  mytree.draw("AVLtree",0,true);

  //triggers rotation in right side (26 & 30) & then at the root (22 & 24)
  mytree.insert(22);
  mytree.draw("AVLtree",0,true);

  //triggers no rotation
  mytree.insert(26); mytree.insert(25); mytree.insert(15);
  mytree.draw("AVLtree",0,true);

  //triggers double rotation in left (14 & 15) & (13 & 14)
  mytree.insert(14);
  mytree.draw("AVLtree",0,true);

  //triggers no rotation
  mytree.insert(35); mytree.insert(23);
  mytree.draw("AVLtree",0,true);

  //triggers double rotation in right (35 & 38) & (38 & 40)
  mytree.insert(38);
  mytree.draw("AVLtree",0,true);

  //triggers no rotation
  mytree.insert(75);
  mytree.draw("AVLtree",0,true);

  //triggers double rotation in right (50 & 75) & (40 & 50)
  mytree.insert(50);
  mytree.draw("AVLtree",0,true);


  //test functions
  if (mytree.find(11))
    cout << "Successfully found 11" << endl;
  else
    cout << "Error: 11 was not found" << endl;
  if (mytree.find(35))
    cout << "Successfully found 35" << endl;
  else
    cout << "Error: 35 was not found" << endl;

  if (mytree.find(101))
    cout << "Error: found 101 in tree" << endl;
  else
    cout << "Successful did not find 101 in tree" << endl;

}

