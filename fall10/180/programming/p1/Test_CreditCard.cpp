/** Program to test the CreditCard Class */
#include "CreditCard.h"				// provides CreditCard
#include <iostream>                             // provide cout
using namespace std;				// make std accessible

int main() {				// CreditCard test function

  CreditCard visa("5391 0375 9387 5309", "John Bowman", 2500, 0.0079);

  visa.chargeIt(32575);
  visa.chargeIt(80000);
  visa.chargeIt(-10000); //negative charge. should be ignored
  
  visa.chargeIt(10000);
  visa.processMonth();
  cout << endl << "At end of first month:" << endl << visa;

  visa.chargeIt(22800);
  visa.makePayment(10000);
  visa.chargeIt(250000000); //charge over the limit. should be ignored.
  visa.makePayment(19000); //negative payment should be ignored. 
  visa.makePayment(-19000);
  visa.makePayment(1000);
  visa.processMonth();
  cout << endl << "At end of second month:" << endl << visa;

  visa.processMonth();
  cout << endl << "At end of third month:" << endl << visa;

  visa.makePayment(120000);
  visa.chargeIt(50000);
  visa.processMonth();
  cout << endl << "At end of fourth month:" << endl << visa;

  visa.makePayment(47500);
  visa.processMonth();
  cout << endl << "At end of fifth month:" << endl << visa;

  visa.makePayment(450000); //paying more than due account should go negative minPayment of 0
  visa.processMonth();
  cout << endl << "At end of sixth month:" << endl << visa;

  visa.chargeIt(3000);
  visa.processMonth();
  visa.chargeIt(37000); // charge after monthly process statement balance and current balance 
			// should be different.
  cout << endl << "At end of seventh month:" << endl << visa;

  visa.processMonth();
  cout << endl << "At end of eighth month:" << endl << visa;

  visa.chargeIt(1000000);   //When the charge exceeded the limit
  visa.processMonth();
  cout << endl << "At end of ninth month:" << endl << visa;
  
  visa.chargeIt(-20000);    //Charge is negative
  visa.makePayment(-10000);   //payment is negative
  visa.processMonth();
  cout << endl << "At end of tenth month:" << endl << visa;
  
  return 0;
}
