#include "List.h"
#include <iostream>
using namespace std;

int main() {
 
  List<float> mylist;
  
  mylist.push_front(12.2);
  mylist.push_front(58.7);
  
  mylist.push_back(3.14);

  List<float>::iterator it;
  
//  mylist.draw("list", 0, true);

  for (it = mylist.begin(); it != mylist.end(); it++) {
    cout << *it << " " << endl;
//    mylist.draw("list", &it, true);
  }
  cout << endl;
 
  
  //test inserting in middle
  
  
  //test erase
  
  //test deep copies with operator= and copy constructor
  
}
