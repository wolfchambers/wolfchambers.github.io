#include "LinkedQueue.h"
#include <iostream>
using namespace std;

int main() {
  
  LinkedQueue<float> myqueue;
  
  myqueue.push(11.2);
  myqueue.push(14.6);
  
  cout << myqueue.front() << endl;
  cout << myqueue.size() << endl;
  
  myqueue.pop();
  cout << myqueue.front() << endl;
  
  myqueue.pop();
  
  myqueue.pop();
}