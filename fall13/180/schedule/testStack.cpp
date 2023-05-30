#include "ArrayStack.h"
//#include "LinkedStack.h"
#include <iostream>
using namespace std;

int main() {

  ArrayStack<float> mystack;
  cout << "constructor ran" << endl;
  
  cout << "testing push" << endl;
  mystack.push(3.2);
  mystack.push(1.1);
  mystack.push(6.2);
  
  cout << "testing size and empty" << endl;
  cout << mystack.size() << endl;
  if (mystack.empty())
    cout << "stack is empty" << endl;
  else
    cout << "stack is not empty" << endl;
  
  cout << "top is " << mystack.top() << endl;
  
  mystack.pop();
  cout << "top is " << mystack.top() << endl;
  
  cout << "testing copy constructor" << endl;
  ArrayStack<float> stack2(mystack);

}
