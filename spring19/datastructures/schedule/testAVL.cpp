//#include "BinaryTree.h"
#include "AVLTree.h"
#include <iostream>
using namespace std;

int main() {

  AVLTree<int> mytree;

  cout << "In main, created a tree" << endl;
  
  mytree.insert(10);
  cout << "Inserted the root" << endl;

  mytree.insert(5);
  mytree.insert(15);
  cout << "past insert" << endl;

  mytree.draw("AVLtree",0,true);
 
  cout << "insert 21: should trigger no rotation" << endl;
  mytree.insert(21);
  mytree.draw("AVLtree",0,true);
  
  cout << "insert 35: triggers rotation in right side" << endl;
  mytree.insert(35);
  mytree.draw("AVLtree",0,true);
  
  cout << "insert 42: triggers rotation at root" << endl;
  mytree.insert(42);  
  mytree.draw("AVLtree", 0, true);

  cout << "insert 20 and 44: triggers no rotation on either side" << endl;
  mytree.insert(20);
  mytree.insert(44);
  mytree.draw("AVLtree",0,true);


  cout << "insert 18: triggers rotation at 15" << endl;
  mytree.insert(18);
  mytree.draw("AVLtree",0,true);

  cout << "insert 17: triggers rotation at 10" << endl;
  mytree.insert(17);
  mytree.draw("AVLtree",0,true);

  cout << "insert 3: trigger a rotation at 10" << endl;
  mytree.insert(3);
  mytree.draw("AVLtree",0,true);

  cout << "insert 16: trigger rotation at root - 18 new root" << endl;
  mytree.insert(16);
  mytree.draw("AVLtree",0,true);

  cout << "running some test functions in case draw functions don't work" << endl;
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
