//import credit card headers
#include "CreditCard.h"

//constructor
CreditCard::CreditCard(string num, string nme, int lim, double bal) : number(num), name(nme), balance(bal), limit(lim) {}

//function to make a charge
bool CreditCard::chargeIt(double price) {
	//if over the limit, do not make the charge
	if (price + balance > double(limit))
		return false; 
	balance += price;
	return true;
}

ostream& operator<<(ostream& out, const CreditCard& c) {
	out << "Number = " << c.getNumber() << endl
		<< "Name = " << c.getName() << endl
		<< "Balance = " << c.getBalance() << endl
		<< "Limit = " << c.getLimit() << endl;
	return out;
}
