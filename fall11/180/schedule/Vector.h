#include <stdexcept>
using namespace std;

/** The vector class
 * based on implementation from chapter 6 of textbook
 */

template <typename Object>
class Vector {
  
private:
  


  int _capacity;	//current maximum capacity
  int _size;		//number of elements in vector currently
  Object * _data;	//array to store the vector
   
public:
  
  /** Constructor
   * input parameter: default maximum capacity
   */
  Vector(int cap = 100) : _capacity(cap), _size(0), _data(new Object[_capacity]) {}
  
  /** Destructor **/
  ~Vector() {
    delete _data;
  }
  
  int size() {
    return _size;
  }
  
  //check if size is equal to 0
  bool empty() {
    return (_size == 0);
  }
  
  /** Operator[] function
   * Input parameter: index which we wish to access
   * Return value: a live reference to that position in the vector
   */
  Object& operator[](int index) {
    
    //check if index is valid
    if ((index >= _size) || (index < 0))
      throw runtime_error("index out of bounds");
    
    return _data[index];
  }
  
  /** Erase function
   * deletes data at a specified index
   * input parameter: index of element to delete
   */
  void erase(int index) {
    
    //check if index is valid
    if ((index >= _size) || (index < 0))
      throw runtime_error("index out of bounds");
    
    //copy objects down to erase the desired index
    for (int i = index; i < _size-1; i++)
      _data[i] = _data[i+1];
    _size--;

  }
  
  
  /** insert function
   * adds a value in a specified location and moves the rest of the data down
   * if size of array exceeds maximum capacity, the size  of the array is doubled and the elements are copied to a new array
   * input parameters: the value to add and the index of its location
   */
  void insert(Object value, int index) {
    
    if (_size == _capacity) { //need to double the array

      _capacity = _capacity*2;
      Object * newarray = new Object[_capacity];
      
      for (int i = 0; i < _size; i++)
	newarray[i] = _data[i];
      delete _data;
      _data = newarray;

    } //now there is room for the new element
    
      
    //move elements down
    for (int i = _size; i > index; i--)
      _data[i] = _data[i-1];
    _data[index] = value;
    _size++;
      
    
  }
  
  /** Copy constructor (to make deep copy) **/
  Vector(const Vector& other) {
   copyFrom(other);
  }
  
  /** Operator equal (to make deep copy) **/
  Vector& operator=(const Vector& other) {
   if (this != & other) {
     delete _data;
     copyFrom(other);
   }
   return *this;
  }

  /** pop_back
   * removes the last element in the vector 
   */
  void pop_back() {
    _size--;
  }
  
  /** remove the first element in the vector
   */
  void pop_front() {
    erase(0);
  }
  
  /** add element to back of the vector **/
   void push_back(Object e) {
     insert(e, _size);
   }
   
  
  /** add element to the front of the vector **/
  void push_front(Object e) {
    insert(e, 0);
  }
  
  /** return the maximum possible capacity of the vector **/
  int capacity() {
    return _capacity;
  }
   
   
   
   protected:
     void copyFrom(const Vector& other) {
      _size = other._size;
      _capacity = other._capacity;
    
      //initialize _data
      _data = new Object[_capacity];
    
      for (int i = 0; i < _size; i++)
	_data[i] = other._data[i];
    }
};