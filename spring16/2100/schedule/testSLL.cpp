#include "SLinkedList.h"
#include <iostream>
using namespace std;

int main() {
  SLinkedList<int> numlist;
  
  if (numlist.empty())
    cout << "You successfully made an empty list!" << endl;
  
  try {
    numlist.removeFront(); 
  }
  catch(domain_error) {
    cout << "invalid op" << endl;
  }
  
  numlist.addFront(2);
  
  
  cout << numlist.front() << endl;
  numlist.addFront(7);
  
  cout << numlist.front() << endl;
  
  numlist.removeFront();
  cout << numlist.front() << endl;
  
  SLinkedList<char> charlist;
  
  charlist.addFront('b');
  charlist.addFront('d');
  
  cout << charlist.front() << endl;
  
  SLinkedList<int> anotherlist(numlist);
  
  anotherlist.addFront(13);
  cout << numlist.front() << " " << anotherlist.front() << endl;
}
