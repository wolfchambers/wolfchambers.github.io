//#include "BinaryTree.h"
#include "BinarySearchTree.h"
#include <iostream>
using namespace std;

int main() {

  BinarySearchTree<int> mytree;
  
  mytree.insert(10);
  mytree.insert(5);
  mytree.insert(15);

  mytree.draw("BStree",0,true);
 
  mytree.insert(21);
  mytree.insert(35);
  mytree.insert(42);
  
  mytree.draw("BStree", 0, true);

  mytree.insert(11);
  mytree.insert(7);
  mytree.insert(29);
  
  mytree.draw("BStree", 0, true);  

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
  
  //need to test remove!
  
}
