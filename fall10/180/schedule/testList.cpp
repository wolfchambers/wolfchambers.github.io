#include "List.h"
#include <iostream>
using namespace std;

int main() {
  List<int> mylist; // create a list
  
  //add a few elements and keep drawing it
  mylist.draw("list", 0, true);
  mylist.push_back(5);
  mylist.draw("list", 0, true);
  mylist.push_back(10);
  mylist.draw("list", 0, true);
  mylist.push_back(100);
  mylist.draw("list", 0, true);
  mylist.push_front(11);
  mylist.draw("list", 0, true);
  mylist.pop_back();
  mylist.draw("list", 0, true);
  
  List<int>::iterator it = mylist.begin();
  mylist.draw("list", &it, true);
  mylist.insert(it, 7);
  mylist.draw("list", &it, true);
  
  it = mylist.end();
  mylist.insert(it, 12);
  mylist.draw("list", &it, true);
  
  //test the iterator code
  //Note: we need the begin and end functions for this one!
//   List<int>::iterator iter = mylist.begin();
//   mylist.draw("list", &iter, true);
//   while (iter != mylist.end()) {
//     ++iter;
//     mylist.draw("list", &iter, true);
//   }
}