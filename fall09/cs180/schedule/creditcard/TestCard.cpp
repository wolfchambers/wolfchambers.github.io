#include "CreditCard.h"
using namespace std;

void testCard(){

	//create an array of 10 credit card pointers
	CreditCard* wallet[10]; 

	//make a few cards
	wallet[0] = new CreditCard("1234 5678 9012 3456", "Sarah Jane Smith", 5000);
	wallet[1] = new CreditCard("0987 6543 2109 8765", "Martha Jones", 4000);
	wallet[2] = new CreditCard("0192 8374 6501 9283", "Jack Harkness", 8000);

	//make a few changes to values
	for (int j=1; j <=16; j++) {
		wallet[0]->chargeIt(double(j)); //explicit casting
		wallet[1]->chargeIt(2*j); //implicit casting
		wallet[2]->chargeIt(double(3*j));
	}

	cout << "Card payments" << endl;

	//make more changes to cards
	for (int i=0; i < 3; i++) {
		cout << *wallet[i];
		while (wallet[i]->getBalance() > 100.0) {
			wallet[i]->makePayment(100.00);
			cout << "New balance = " << wallet[i]->getBalance() << endl;
		}

		cout << endl;
		delete wallet[i];
	}
} //end function

int main() {
	testCard();
	return 0;
}
