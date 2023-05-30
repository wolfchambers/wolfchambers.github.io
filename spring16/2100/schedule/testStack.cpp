#include "ArrayStack.h"
#include <iostream>
using namespace std;

int main() {
  ArrayStack<int> mystack;
  
  for (int i = 0; i < 5; i++) {
    mystack.push(i);
    cout << mystack.top() << endl;
  }
  
  mystack.pop();
  mystack.pop();
  
  //top should be 2
  cout << mystack.top() << endl;
  
  cout << "Current size is " << mystack.size() << endl;
  
  ArrayStack<int> stack2(mystack);
  stack2.push(11);
  
  //these should be different - 11 and 2
  cout << stack2.top() << " " << mystack.top() << endl;
  
  //test operator=
  mystack = stack2;
  cout << stack2.top() << " " << mystack.top() << endl;
  stack2.push(13);
  cout << stack2.top() << " " << mystack.top() << endl;
  

}