#include <stdexcept>
using namespace std;

/** The vector class
 * based on implementation from chapter 6 of textbook
 */
template <typename Object>
class Vector {
  
private:
  


  int _capacity;		//current maximum capacity
  int _size;		//number of elements in vector currently
  Object * _data;	//array to store the vector
   
public:

  Vector(int cap=100) : _capacity(cap), _size(0), _data(new Object[_capacity]) {}
  
  ~Vector() {
   delete[] _data;
  }
  
  void insert(int index, const Object& element) {
    
    if ((index > _size) || (index < 0))
      throw runtime_error("index out of bounds");
      
    
    //check if size == capacity
    if (_size == _capacity) {
     _capacity *= 2;
     
     Object* newarray = new Object[_capacity];
     for (int i=0; i < _size; i++)
       newarray[i] = _data[i];
     
     delete[] _data;
     _data = newarray;
    }
    
    //we know there is room for new element
    for (int i=_size; i > index; i--)
      _data[i] = _data[i-1];
    _data[index] = element;
    _size++;
  }
  
  int size() const {
   return _size; 
  }
  
  bool empty() const {
    return _size == 0;
  }
  
  Object& operator[](int index) {
    
    if ((index < 0) || (index >= _size))
      throw runtime_error("index out of bounds");
    
    return _data[index];
    
  }
  
  void erase(int index) {
    if ((index >= _size) || (index < 0))
      throw runtime_error("index out of bounds");
    
    for (int i = index; i < _size-1; i++)
      _data[i] = _data[i+1];
    
    _size--;
  }
  
  //copy constructor
  Vector(const Vector& other) {
    _capacity = other._capacity;
    _size = other._size;
    
    _data = new Object[_capacity];
    
    for (int i = 0; i < _size; i++)
      _data[i] = other._data[i];
  }
  
  //operator=
  Vector& operator=(const Vector& other) {
    
  }
  
  void push_back(Object e) {
    insert(_size, e);
  }
  
  void pop_back() {
    erase(_size-1);
  }  
  
};