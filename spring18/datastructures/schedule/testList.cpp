#include <iostream>
#include "List.h"

int main() {
  
  List<int> mylist;
  List<int>::iterator it;
  
  mylist.push_front(5);
  mylist.push_front(11);
  mylist.push_front(21);
  
  for (it = mylist.begin(); it != mylist.end(); it++)
    cout << *it << " ";
  cout << endl;
  
  it = mylist.begin();
  *it = *it + 12;
  
  it++;
  mylist.insert(it,10);
  
  for (it = mylist.begin(); it != mylist.end(); it++)
    cout << *it << " ";
  cout << endl;  
  
  mylist.pop_back();
  mylist.pop_front();
  
  for (it = mylist.begin(); it != mylist.end(); it++)
    cout << *it << " ";
  cout << endl;
  
  //test copy constructor
  List<int> otherlist(mylist);
  otherlist.print_list();
  mylist.push_front(-3);
  mylist.print_list();
  
  //test operator=
  mylist = otherlist;
  mylist.print_list();
  
}
