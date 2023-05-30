#include "CreditCard.h"


void testCard(){

	//create a vector of 10 credit card pointers
	CreditCard* wallet1;
	CreditCard* wallet2;
	CreditCard* wallet3;

	//make a few cards
	wallet1 = new CreditCard("1234 5678 9012 3456", "Sarah Jane Smith", 5000);
	wallet2 = new CreditCard("0987 6543 2109 8765", "Martha Jones", 4000);
	wallet3 = new CreditCard("0192 8374 6501 9283", "Jack Harkness", 8000);

	//make a few changes to values
	for (int j=1; j <=16; j++) {
		wallet1->chargeIt(double(j)); //explicit casting
		wallet2->chargeIt(2*j); //implicit casting
		wallet3->chargeIt(double(3*j));
	}

	cout << "Card payments" << endl;

	cout << *wallet1;
	while (wallet1->getBalance() > 100.0) {
		wallet1->makePayment(100.00);
		cout << "New balance = " << wallet1->getBalance() << endl;
	}

	cout << endl;
	delete wallet1;

	cout << *wallet2;
	while (wallet2->getBalance() > 100.0) {
		wallet2->makePayment(100.00);
		cout << "New balance = " << wallet2->getBalance() << endl;
	}

	cout << endl;
	delete wallet2;

	cout << *wallet3;
	while (wallet3->getBalance() > 100.0) {
		wallet3->makePayment(100.00);
		cout << "New balance = " << wallet3->getBalance() << endl;
	}

	cout << endl;
	delete wallet1;
	
} //end function

int main() {
	testCard();
	return 0;
}