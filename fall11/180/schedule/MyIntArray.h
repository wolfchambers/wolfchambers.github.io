#include <iostream>
#include <stdexcept>
using namespace std;

class MyIntArray {
  
private:
  int _size;
  int* _A;
  
public:
  
  MyIntArray(int s = 10) : _size(s), _A(new int[_size]) {}

  int& operator[] (int index) {
    if (index >= _size)
      throw out_of_range("Index out of range");
    
    return _A[index];
  }
  
  ~MyIntArray() {
    delete _A;
  }
  
};