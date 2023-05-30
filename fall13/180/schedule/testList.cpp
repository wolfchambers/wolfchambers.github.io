#include "List.h"
#include <iostream>
using namespace std;

int main() {
  List<int> mylist;
  
  mylist.push_front(11);
  mylist.push_front(1);
  mylist.push_front(4);
  
  List<int>::iterator it;
  for (it = mylist.begin(); it != mylist.end(); it++)
    cout << *it << " ";
  cout << endl;

}