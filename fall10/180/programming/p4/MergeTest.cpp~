#include <cstdlib>
#include <iostream>
#include <fstream>
#include <list>

using namespace std;

void merge(list<int>&, const list<int>&);


// utility class
class Reader {
public:
  Reader() : isr(&cin), lineLimit(-1), lineCount(0), eof(false) { }

  void setInputStream(istream* is) {
    isr = is;
  }

  void setLineLimit(int limit) {
    lineLimit = limit;
  }

  list<int>* buildList() {
    list<int>* data = new list<int>();

    if (eof || (lineLimit!=-1 && lineCount>=lineLimit)) {
      throw 0;
    }

    cout << "Enter a list...\n";

    int value;
    int last=-1;
    (*isr) >> value;
    while (true) {

      lineCount++;

      if ((*isr).eof()) {
	// must be EOF
	if (isr != &cin) {
	  // switch from file to cin
	  isr = &cin;
	  continue;
	} else {
	  cout << "Unexpected end of input reached.\n";
	  throw 0;
	}
      }

      if (!(*isr)) {
	// non-numeric input
	(*isr).clear();	
	(*isr).ignore(numeric_limits<streamsize>::max(),'\n');
	cout << "error on input line " << lineCount << ". Non-numeric data ignored.\n";
      } else if (value<0 || value > 999) {
	if (value==-1) {
	  eof = true;
	  break;
	}

	if (value==1000)
	  break;

	// invalid
	cout << "error on input line " << lineCount << ". Invalid value " << value << " ignored.\n";
      } else {
	if (value < last) {
	  // decreasing
	  cout << "error on input line " << lineCount << ". Decreasing value " << value << " ignored.\n";
	} else {
	  // valid
	  last = value;
	  data->push_back(value);
	}
      }

      if (lineLimit!=-1 && lineCount>=lineLimit) {
	break;
      }

      (*isr) >> value;
    }

    if (lineLimit!=-1 && lineCount>=lineLimit) {
      cout << "ListReader reached the limit of "<< lineLimit << " lines of input.\n";
    }

    return data;
  }

private:
  istream* isr;
  int lineLimit;
  int lineCount;
  bool eof;
};


void print(const list<int>& data) {
  list<int>::const_iterator iter;
  for (iter = data.begin(); iter != data.end(); ++iter)
    cout << *iter << " ";
  cout << endl;
}



int main(int argc, const char* argv[]) {
  filebuf fb;
  Reader reader;

  // override input based upon file, if valid
  if (argc>1) {
    fb.open(argv[1],ios::in);
    if (fb.is_open()) {
      reader.setInputStream(new istream(&fb));
    } else {
      cout << "Input file '" << argv[1] << "' not found.\n";
      cout << "Defaulting to keyboard input.\n\n";
    }
  }


  // is there a limit on the number of lines to read?
  int LIMIT = -1;
  if (argc>2) {
    LIMIT = atoi(argv[2]);
    if (LIMIT < 1) {
      LIMIT = -1;
      cout << "Second argument (" << argv[2] << ") ignored.\n\n";
    } else {
      reader.setLineLimit(LIMIT);
    }
  }


  try {
    while (true) {
      list<int>* A = reader.buildList();
      list<int>* B = reader.buildList();

      cout << "\nBefore the merge, the first list appears as follows.\n";
      print(*A);
      cout << "\nBefore the merge, the second list appears as follows.\n";
      print(*B);
      cout << "\nCalling merge...\n";
      merge(*A, *B);
      cout << "\nThe merged list appears as follows.\n";
      print(*A);
      cout << endl;

      delete A;
      delete B;
    }
  } catch (...) {
    // The list builder will throw an exception when '-1' is reached in input
    cout << "GoodBye\n";
  }

}