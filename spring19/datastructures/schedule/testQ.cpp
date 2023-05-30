#include "ArrayQueue.h"
#include <iostream>
using namespace std;

int main() {

ArrayQueue<int> myQ;

for (int i=0; i < 20; i++)
  myQ.push(i+3);

ArrayQueue<int> otherQ(myQ);

cout << "here" << endl;



cout << myQ.front() << endl;
myQ.pop();
cout << myQ.front() << endl;

cout << otherQ.front() << endl;


}
