#include "Vector.h"
#include <iostream>
using namespace std;

int main() {
  
  Vector<int> myvector;
  
  //test push_back
  myvector.push_back(4);
  myvector.push_back(12);
  
  //test operator[]
  cout << myvector[0] << " " << myvector[1] << endl;
  
  //test push_front
  myvector.push_front(5);
  
  for (int i = 0; i < myvector.size(); i++)
    cout << myvector[i] << " ";
  cout << endl;
  
}