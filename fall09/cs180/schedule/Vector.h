#ifndef __VECTOR_H
#define __VECTOR_H

#include <stdexcept>
using namespace std;

// Deal with constants if they are not defined
#ifndef INITIAL_CAPACITY
  #define INITIAL_CAPACITY 10
#endif
#ifndef EXPANSION_FACTOR
  #define EXPANSION_FACTOR 2
#endif
#ifndef EXPANSION_CONSTANT
  #define EXPANSION_CONSTANT 0
#endif

template<typename ItemType> class Vector {
  private:
    /** The current capacity of the vector */
    int currentCapacity;

    /** The current size of the vector */
    int numItems;

    /** Array that contains the data */
    ItemType *data;

  public:
    /**
     *  Default constructur
     */
    Vector<ItemType>() : currentCapacity(INITIAL_CAPACITY), numItems(0), data(new ItemType[INITIAL_CAPACITY]) {
    }

    /**
     *  Copy constructor
     */
    Vector<ItemType>(const Vector<ItemType>& other) : currentCapacity(other.currentCapacity), data(new ItemType[other.currentCapacity]), numItems(other.numItems) {
      for (int i=0; i<numItems; i++)
        data[i] = other.data[i];
    }

    /**
     *  Destructor
     */
    ~Vector<ItemType>() {
      delete []data;
    }

    /**
     *  Access the length
     */
    int size() const {
      return numItems;
    }

    /**
     *  Access an element at a particular position (and change it)
     */
    ItemType& operator[](int index) {
      return data[index];
    }

    /**
     *  Access an element at a particular position (read-only)
     */
    const ItemType& operator[](int index) const {
      return data[index];
    }

    /**
     *  Access an element (with index checking) at a particular position (and change it)
     */
    ItemType& at(int index) {
      if (index >= numItems)
        throw out_of_range("Index out of range");
      return data[index];
    }

    /**
     *  Access an element (with index checking) at a particular position (read-only)
     */
    const ItemType& at(int index) const {
      if (index < 0 || index >= numItems)
        throw out_of_range("Index out of range");
      return data[index];
    }

    /**
     *  Append a new item to the end of the vector
     */
    void push_back(const ItemType& value) {
      insert(numItems, value);
    }

    /**
     *  Insert a new item at the appropriate location.
     */
    void insert(int index, const ItemType& value) {
      if (index > numItems)
        throw out_of_range("Index out of range");

      if (numItems == currentCapacity) {
        int oldSize = currentCapacity;
		currentCapacity = currentCapacity*EXPANSION_FACTOR + EXPANSION_CONSTANT;
        ItemType *oldData = data;
        data = new ItemType[currentCapacity];
        for (int i=0; i<index; i++)
          data[i] = oldData[i];
        for (int i=index+1; i<=numItems; i++)
          data[i] = oldData[i-1];
        delete[] oldData;
      }
      else {
        for (int i=numItems; i>index; i--)
          data[i] = data[i-1];
      }
      data[index] = value;
      numItems++;
    }

    /**
     *  Remove the item at the given location
     */
    void erase(int index) {
      if (index >= numItems)
        throw out_of_range("Index out of range");

      for (int i=index+1; i<numItems; i++)
        data[i-1] = data[i];

      numItems--;
    }

    /**
     *  Assignment operator
     */
    Vector<ItemType>& operator=(const Vector<ItemType>& other) {
      if (this != &other) {
        delete []data;
        numItems = other.numItems;
        currentCapacity = other.currentCapacity;
        data = new ItemType[currentCapacity];
        for (int i=0; i<numItems; i++)
          data[i] = other.data[i];
      }
      return *this;
    } 

};

#endif
