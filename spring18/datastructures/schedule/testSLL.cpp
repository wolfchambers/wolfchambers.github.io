#include "SLinkedList.h"
#include <iostream>
#include <stdexcept>
using namespace std;

int main() {

  SLinkedList<int> mylist;

  if (mylist.empty())
   cout << "list is empty" << endl;

  mylist.addFront(10);
  mylist.addFront(15);
  cout << mylist.front() << endl;  //should be 15

  mylist.printlist();

  mylist.removeFront();
  cout << mylist.front() << endl; //should be 10

}
