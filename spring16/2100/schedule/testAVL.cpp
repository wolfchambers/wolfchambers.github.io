//#include "BinaryTree.h"
#include "AVLTree.h"
#include <iostream>
using namespace std;

int main() {

  AVLTree<int> mytree;
  
  mytree.insert(10);
  mytree.insert(5);
  mytree.insert(15);
  cout << "past insert" << endl

  mytree.draw("AVLtree",0,true);
 
  //triggers no rotation
  mytree.insert(21);
  mytree.draw("AVLtree",0,true);
  
  //triggers rotation in right side
  mytree.insert(35);
  mytree.draw("AVLtree",0,true);
  
  //triggers rotation at root
  mytree.insert(42);  
  mytree.draw("AVLtree", 0, true);

  //triggers no rotation on either side
  mytree.insert(20);
  mytree.insert(44);
  mytree.draw("AVLtree",0,true);


  //triggers rotation at 15
  mytree.insert(18);
  mytree.draw("AVLtree",0,true);

  //triggers rotation at 10
  mytree.insert(17);
  mytree.draw("AVLtree",0,true);

  //trigger a rotation at 10 
  mytree.insert(3);
  mytree.draw("AVLtree",0,true);

  //trigger rotation at root - 18 new root
  mytree.insert(16);
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
