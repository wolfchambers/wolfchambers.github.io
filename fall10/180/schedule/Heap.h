#ifndef __HEAP_H
#define __HEAP_H

template <typename ItemType> class Heap {
  private:
    ItemType* data;
    int capacity, size;

  public:
    Heap() : data(new ItemType[1]), capacity(1), size(0) {
    }

    void insert(const ItemType& val) {
      if (capacity == size) {
        capacity = 2*capacity+1;
        ItemType* newData = new ItemType[capacity];
        for (int i=0; i < size; i++)
          newData[i] = data[i];
        delete []data;
        data = newData;
      }
      
      data[size] = val;
      size++;

      int current = size - 1;
      int parent = (current - 1)/2;
      while (current > 0 && data[current] > data[parent]) {
        ItemType temp(data[current]);
        data[current] = data[parent];
        data[parent] = temp;
        current = parent;
        parent = (current - 1)/2;
      }
    }

    void removeMax() {
      size--;
      data[0] = data[size];

      int current = 0;
      int child1 = 1, child2 = 2;
      bool changed = true;
      while (changed) {
        changed = false;
        if (child2 < size) {
          if (data[child1] > data[child2]) {
            if (data[child1] > data[current]) {
              ItemType temp(data[current]);
              data[current] = data[child1];
              data[child1] = temp;
              current = child1;
              child1 = 2*current+1;
              child2 = child1+1;
              changed = true;
            }
          }
          else {
            if (data[child2] > data[current]) {
              ItemType temp(data[current]);
              data[current] = data[child2];
              data[child2] = temp;
              current = child2;
              child1 = 2*current+1;
              child2 = child1+1;
              changed = true;
            }
          }
        }
        else if (child1 < size) {
          if (data[child1] > data[current]) {
            ItemType temp(data[current]);
            data[current] = data[child1];
            data[child1] = temp;
            current = child1;
            child1 = 2*current+1;
            child2 = child1+1;
            changed = true;
          }
        }
      }

    }

    const ItemType& top() const {
      return data[0];
    }

    unsigned int size() const {
      return size;
    }

    bool empty() const {
      return size == 0;
    }

    void clear() {
      delete []data;
      size = 1;
      capacity = 1;
      data = new ItemType[1];
    }
};

#endif
