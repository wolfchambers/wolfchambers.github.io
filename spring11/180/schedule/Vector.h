#include <stdexcept>
using namespace std;

template <typename Object>
class Vector {
  
private:
  
  Object * _data; //array to store the vector
  int _size;
  int _capacity;
  
public:
  
  Vector(int cap = 100) {
    _size = 0;
    _capacity = cap;
    _data = new Object[_capacity];
  }
  
  ~Vector() {
    delete _data;
  }
  
  Object& operator[](int i) {
    return _data[i];
  }
  
  void erase(int index) {
    if ((index < 0) || (index > _size))
      throw runtime_error("index is out of range");
    for (int i = index; i < _size -1; i++)
      _data[i] = _data[i+1];
    _size--;
  }
  
  void insert(Object value, int index) {
    if (index > _size)
      throw runtime_error("Index out of range");
    if (_size == _capacity) {
      _capacity = _capacity * 2;
      Object *oldData = _data;
      _data = new Object[_capacity];
      for (int i = 0; i < index; i++)
	_data[i] = oldData[i];
      for (int i = index+1; i < _size; i++)
	_data[i] = oldData[i-1];
      delete oldData;
    }
    else  {
      for (int i = _size; i > index; i--)
	_data[i] = _data[i-1];
    }
    _data[index] = value;
    _size++;
  }
  
  Vector(const Vector& other) {
   _size = other._size;
   _capacity = other._capacity;
   
   _data = new Object[_capacity];
   for (int i = 0; i < _size; i++)
     _data[i] = other._data[i];
   
  }
  
  Vector& operator=(const Vector& other) {
   if (this != & other) {
    _size = other._size;
    _capacity = other._capacity;
    
    delete [] _data;
    
    _data = new Object[_capacity];
    for (int i = 0; i < _size; i++)
      _data[i] = other._data[i];    
   }
   return *this;
  }
  
  void pop_back() {
    //erase(_size-1);
    if (_size > 0)
      _size--;
    else
      throw runtime_error("Vector is already empty");
  }
  
  void pop_front() {
    erase(0);
  }
  
   void push_back(Object e) {
    insert(e,_size);
   }
};
