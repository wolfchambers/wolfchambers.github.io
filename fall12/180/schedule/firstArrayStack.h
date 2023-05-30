#include <stdexcept>
using namespace std;

template <typename Object>
class ArrayStack {

private: 
  int _capacity;
  int _size;
  Object* _S;

public:
  
  int size() const {
    return _size;
  }

  bool empty() const {
    return _size == 0;
  }

  ArrayStack(int cap = 100) {
    _capacity = cap;
    _size = 0;
    _S = new Object[_capacity];
  }

  const Object& top() {
    if (empty())
      throw runtime_error("Access to empty stack");
    return _S[_size-1];
  }

//  Object& top() {
//
//  }

  void push(Object e) {
    //check if too big and double capacity if so
    if (_size == _capacity) {
      _capacity *= 2;
      Object* newS = new Object[_capacity];
      for (int i=0; i < _size; i++)
        newS[i] = _S[i];
      delete _S;
      _S = newS;
    }

    //insert the new element on top
    _S[_size] = e;
    _size++;
  }

  void pop() {
    if (empty()) 
      throw runtime_error("Can't pop from empty stack!");
    _size--;
  }
}; //end of ArrayStack

