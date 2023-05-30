#include <iostream>
#include "SLinkedList.h"
//#include "SLinkedList.cpp"
using namespace std;

int main() {

  SLinkedList<int> mylist;

  mylist.addFront(3);
  cout << mylist.front() << endl;

  mylist.addFront(5);
  cout << mylist.front() << endl;
  
  mylist.removeFront();
  cout << mylist.front() << endl;
  
}
