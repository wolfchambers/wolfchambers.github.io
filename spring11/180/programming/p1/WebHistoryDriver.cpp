#include <stdio.h>
#include <stdlib.h>
#include <cstdlib>
#include <istream>
#include <iostream>
#include <fstream>
#include <string>
#include <stdexcept>
#include "LeakyStack.h"
#include "LeakyStackA.h"
#include "LeakyStackB.h"

using namespace std;

istream *isr;
bool echoinput;
bool endOfInput=false;



string* GeneralQuestion(string* prompt) {
  string response;
  string *answer = &response;
  bool done = false;

  if (prompt)
    cout << *prompt;
  while (!done) {
    getline(*isr, response);
    if ((*isr).eof()) {
      // must be EOF
      if (echoinput) {
	// switch to keyboard input
	isr = &cin;
	echoinput=false;
      } else {
	cout << "unexpected end of input reached.\n";
	endOfInput = true;
	answer = NULL;
	done=true;
      }
    } else {
      // successful so far
      if (echoinput) cout << response << "\n";
      if ((response).length()>0) done=true;
    }
  }

  if (answer) {
    answer = new string(response);
  }

  return(answer);
}




bool valid(LeakyStack *ls) {
  if (ls==NULL) {
    cout << "The history has not yet been properly initialized.\n";
    return(false);
  } else {
    return(true);
  }

}


int main(int argc, const char* argv[]) {
  string MENU = "Valid commands include:\n(A)  create or reinitialize with LeakyStackA.\n(B)  create or reinitialize with LeakyStackB.\n(S)  call size.\n(E)  call empty.\n(U)  call push.\n(P)  call pop\n(T)  call top\n(Q)  Quit.";


  filebuf fb;
  bool quit = false;
  int value;
  int i;
  int command=1;
  string *response;
  string answer;
  char choice;

  LeakyStack *LS = NULL;

  // choose between keyboard input or mock-keyboard file input
  echoinput = false;
  isr = &cin;
  if (argc>1) {
    fb.open(argv[1],ios::in);
    if (fb.is_open()) {
      isr = new istream(&fb);
      echoinput= true;
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
    }
  }


  cout << MENU << "\n";
  do {
    char temp[50];
    sprintf(temp,"\nCommand #%i> ",command);
    response = GeneralQuestion(new string(temp));
    command++;

    if (response==NULL) {	
      choice = 'q';
    } else {
      choice = (*response)[0];
      if (response) delete response;
    }


    switch (choice)
      {
      case 'a':
      case 'A':
      case 'b':
      case 'B':
	response = GeneralQuestion(new string("Enter a capacity for the history: "));

	if (!response) {
	    cout << "Invalid capacity.  Aborting command.\n";
	} else {
	  value = atoi((*response).c_str());
	  delete response;

	  if (value<1) {
	    cout << "Invalid capacity.  Aborting command.\n";
	  } else {
	    if ((choice=='a') || (choice=='A')) {
	      LS = new LeakyStackA(value);
	      cout <<  "LeakyStackA constructor called with capacity " << value << "\n";
	    } else {
	      LS = new LeakyStackB(value);
	      cout << "LeakyStackB constructor called with capacity " << value << "\n";
	    }
	  }
	}
	break;

      case 's':
      case 'S':
	if (valid(LS)) {
	  i = (*LS).size();
	  cout << "size( ) returned " << i << "\n";
	}
	break;

      case 'e':
      case 'E':
	if (valid(LS)) {
	  bool s = (*LS).empty();
	  cout << "empty( ) returned " << (s ? "true" : "false") << "\n";
	}
	break;

      case 'u':
      case 'U':
	if (valid(LS)) {
	  response = GeneralQuestion(new string("Enter item to push: "));
	  if (!response) {
	    cout << "Error in reading item.  Aborting command.\n";
	  } else {
	    (*LS).push((*response));
	    delete response;
	  }
	}
	break;

      case 'p':
      case 'P':
	if (valid(LS)) {
	  try {
	    (*LS).pop();
	  } catch (runtime_error e) {
	    cout << "pop( ) threw a runtime_error\n";
	  }

	}
	break;

      case 't':
      case 'T':
	if (valid(LS)) {
	  try {
	    answer = (*LS).top();
	    cout << "top( ) returned " << answer << "\n";
	  } catch (runtime_error e) {
	    cout << "top( ) threw a runtime_error\n";
	  }

	}
	break;

      case 'q':
      case 'Q':
	quit = true;
	break;

      default:
	cout << "Unrecognized option: " << choice << "\n";
	cout << MENU << "\n";
      }
  } while (!quit  && (LIMIT<0 || command<LIMIT));

  cout << "\n";
  if (isr != &cin)  delete isr;

  return(0);
}




