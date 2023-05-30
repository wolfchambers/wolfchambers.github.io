#include <iostream>
#include "Vector.h"
using namespace std;

int main() {

  //test constructor
  Vector<int> intvec(2);
  Vector<char> charvec;
  
  //should test push_back, insert, and resizing in insert
  for (int i = 0; i < 15; i+=2)
    intvec.push_back(i);
  
  //test operator[] and size()
  for (int i= 0; i<intvec.size(); i++)
    cout << intvec[i] << " ";
  cout << endl;
  
  //test erase
  intvec.erase(3);
  
  //now 6 at position 3 should be gone
  for (int i= 0; i<intvec.size(); i++)
    cout << intvec[i] << " ";
  cout << endl;  
  
  Vector<int> mycopy(intvec);
  for (int i=0; i<mycopy.size(); i++)
    cout << mycopy[i] << " ";
  cout << endl;
  
  mycopy.push_back(56);
  mycopy.insert(0,68);
  for (int i= 0; i<intvec.size(); i++)
    cout << intvec[i] << " ";
  cout << endl;   
  for (int i=0; i<mycopy.size(); i++)
    cout << mycopy[i] << " ";
  cout << endl;  
  
  intvec = mycopy;
  for (int i= 0; i<intvec.size(); i++)
    cout << intvec[i] << " ";
  cout << endl;  
  
  charvec.insert(0,'a');
  cout << charvec[0] << endl;
}