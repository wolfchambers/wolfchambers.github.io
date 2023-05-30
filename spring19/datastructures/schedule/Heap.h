#ifndef __HEAP_H
#define __HEAP_H

/* 
Class to store a max heap
*/

template <typename T> 
class Heap {

  private:
    T* _data;				//pointer to underlying array to hold data
    unsigned int _capacity, _size;	//max capacity and size of array

  public:

    /* Contructor: makes empty heap */
    Heap() : _data(new T[1]), _capacity(1), _size(0) {}

    /*  Insert function: inserts into the heap
      input val: the value to be added
    */
    void insert(const T& val) {
      
      //check if size == capacity, expand if so
      if (_size == _capacity) {
	_capacity = _capacity*2;
	T* newarray = new T[_capacity];
	for (int i = 0; i < _size; i++)
	  newarray[i] = _data[i];
	delete[] _data;
	_data = newarray;	
      }
      
      //insert the new value
      _data[_size] = val;
      _size++;
      
      //"bubble-up" if not a heap
      int current = _size-1;
      int parent = (current-1)/2;
      
      //loop to bubble up
      while ((_data[current] > _data[parent]) && (current != 0)) {
	
	//swap current and parent
	T temp = _data[current];
	_data[current] = _data[parent];
	_data[parent] = temp;
	
	//update loop control variables
	current = parent;
	parent = (current-1)/2;
      }
      
    } //end insert

    /* removeMax: removes maximum value from the head */
    void removeMax() {
      
      //move last leaf up to root
      _data[0] = _data[_size-1];
      _size--;
      
      //need to "bubble" down
      int current = 0;
      int left = 1;
      int right = 2;
      T temp;
      
      while (((left < _size) && (_data[current] < _data[left])) || (right < _size) && (_data[current] < _data[right])) {
	
	if (right >= _size) {
	  //swap with left
	  temp= _data[left];
	  _data[left] = _data[current];
	  _data[current] = temp;
	  current = left;
	}
	else {
	  //find bigger child
	  if (_data[left] > _data[right]) {
	   //swap with left 
	   temp= _data[left];
	   _data[left] = _data[current];
	   _data[current] = temp;
	   
	   current = left;
	  }
	  else {
	    //swap with right
	    temp = _data[right];
	    _data[right] = _data[current];
	    _data[current] = temp;
	    current = right;
	    
	  }
	}
	//update loop control variables
	left = current*2 + 1;
	right = left+1;
	
      }

    } //end removeMax

    /* getMax: returns maximum value in heap 
    Note: returns const reference so that user cannot destroy heap property 
    */
    const T& getMax() const {
      return _data[0];
    }

    /* size: returns current size of the heap */
    unsigned int size() const {
      return _size;
    }

    /* empty: returns true if the heap is empty, false otherwise */
    bool empty() const {
      return _size ==0;
    }

    /* clear: empties heap of data */
    void clear() {
    }


    /* Housekeeping funcitons */

    /* Copy constructor */
    Heap(const Heap& other) {

    }

    /* Operator= */ 
    Heap& operator=(const Heap& other){

    }

    /* Destructor */
    ~Heap() {
      delete[] _data;
    }
};

#endif
