#include "smart_stack.h"
#include <iostream>
#include <vector>
using namespace std;
using namespace csci180;


//------------------------------ do not change this portion -----------------------
template<typename Item_Type> int SmartStack<Item_Type>::total=0;  // needed for accounting

void printStack(SmartStack<string>& original) {
  cout << "stack dump: " << original.dump() << endl;;
}

void printCount() {
  cout << "Number of allocated nodes is " << SmartStack<string>::getTotalNumNodes() << endl << endl;
}
//---------------------------------------------------------------------------------





void test() {

  SmartStack<string> r;
  r.push("X");
  r.push("Y");
  r.push("Z");
  cout << "r ";  printStack(r);
  printCount();                       // Figure 0

  // enter new scope so that s can be constructed and later destructed
  if (true) {
    SmartStack<string> s;
    s.push("A");
    s.push("B");
    s.push("C");
    s.push("D");
    cout << "r ";  printStack(r);
    cout << "s ";  printStack(s);
    printCount();                     // Figure 1


    // enter new scope so that t can be constructed and later destructed
    if (true) {    
      SmartStack<string> t(s);
      cout << "r ";  printStack(r);
      cout << "s ";  printStack(s);
      cout << "t ";  printStack(t);
      printCount();                     // Figure 2

      s.push("E");
      cout << "r ";  printStack(r);
      cout << "s ";  printStack(s);
      cout << "t ";  printStack(t);
      printCount();                     // Figure 3

      t.pop();
      cout << "r ";  printStack(r);
      cout << "s ";  printStack(s);
      cout << "t ";  printStack(t);
      printCount();                     // Figure 4

      s = r;
      cout << "r ";  printStack(r);
      cout << "s ";  printStack(s);
      cout << "t ";  printStack(t);
      printCount();                     // Figure 5

      r.pop();
      cout << "r ";  printStack(r);
      cout << "s ";  printStack(s);
      cout << "t ";  printStack(t);
      printCount();                     // Figure 6

      r.push("W");
      cout << "r ";  printStack(r);
      cout << "s ";  printStack(s);
      cout << "t ";  printStack(t);
      printCount();                     // Figure 7

      s.push("V");
      cout << "r ";  printStack(r);
      cout << "s ";  printStack(s);
      cout << "t ";  printStack(t);
      printCount();                     // Figure 8

    }  // t is destroyed               
    cout << "r ";  printStack(r);
    cout << "s ";  printStack(s);
    printCount();                       // Figure 9

  }  // s is destroyed
  cout << "r ";  printStack(r);
  printCount();                         // Figure 10
  
}  // r is destroyed


int main() {
  printCount();   // starts with zero nodes
  test();
  printCount();   // should finish with zero nodes
}
