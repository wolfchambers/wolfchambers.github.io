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
  mylist.print_list();  

  List<int> secondlist(mylist);

  return 0;

}
