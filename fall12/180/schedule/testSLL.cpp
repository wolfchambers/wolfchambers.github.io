#include "SLinkedList.h"
#include <iostream>
using namespace std;

int main() {

  SLinkedList<int> mylist;
  cout << "List created" << endl;

  mylist.addFront(12);
  cout << "added " << mylist.front() << " to front" << endl;


}
