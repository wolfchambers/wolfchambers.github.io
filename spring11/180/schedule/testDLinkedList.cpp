#include "DLinkedList.h"
#include <iostream>
using namespace std;

int main() {
 
  DLinkedList<int> mylist;
  mylist.addFront(4);
  
  cout << mylist.front() << endl;
  mylist.addFront(6);
  cout << mylist.front() << endl;
  cout << mylist.back() << endl;
  
  mylist.addBack(11);
  cout << mylist.back() << endl;
  
  mylist.removeBack();
  cout << mylist.back() << endl;
  
  mylist.removeFront();
  cout << mylist.front() << endl;
}