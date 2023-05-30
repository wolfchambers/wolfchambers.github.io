#include "ArrayQueue.h"
#include <iostream>
using namespace std;

int main() {
  
  ArrayQueue<int> numQueue;
  
  numQueue.push(5);
  numQueue.push(10);
  
  cout << "front is: " << numQueue.front() << endl;
  numQueue.pop();
  cout << "front is: " << numQueue.front() << endl;

}