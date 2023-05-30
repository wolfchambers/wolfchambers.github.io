#include "SLinkedList.h"
#include <iostream>
using namespace std;

int main() {
  
  char letter;
  
  //test constructor
  SLinkedList<float> numList;
  

  if (numList.empty())
    cout << "Yeah, we're empty!" << endl;
  else
    cout << "Your list should be empty" << endl;
  
  numList.addFront(7.8);
  cout << "Added " << numList.front() << " to our list" << endl;
  
  //test a different type
  SLinkedList<char> letterList;
  
  cout << "Enter a letter: " << endl;
  cin >> letter;

  letterList.addFront(letter);
  
  cout << "test remove on letter list" << endl;
  letterList.removeFront();
  if (letterList.empty())
    cout << "remove must have worked" << endl;
}
