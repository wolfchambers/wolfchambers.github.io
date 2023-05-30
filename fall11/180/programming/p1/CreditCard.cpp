#include "CreditCard.h"				// provides CreditCard
#include <iostream>
#include <iomanip>                              // needed for formatting output
using namespace std;


// All of the required methods are stubbed out below.  You should
// complete the implementations.

/** Construct a new credit card.
 *
 *  @param  no   the credit card number (expressed as a string)
 *  @param  nm   the card-holder's name
 *  @param  lim  maximum limit for card (expressed in dollars)
 *  @param  rt   A fraction which represents the monthly interest rate
 *  @param  bal  Initial balance for this account (expressed in cents)
 */
CreditCard::CreditCard(string no, string nm, int lim, double rt, int bal)
{ }

//////////////////////////////////////
// accessors
//////////////////////////////////////

/** Return the card number.
 *  @return  string representing the card number
 */
string CreditCard::getNumber() const {
}

/** Return the name of the card holder.
 *  @return  person's name as a string
 */
string CreditCard::getName() const {
}

/** Return the credit limit.
 *  @return  limit (expressed in dollars)
 */
int CreditCard::getLimit() const {
}

/** Return the interest rate.
 *  @return  monthly interest rate (e.g. 0.0079 for 0.79% monthly rate)
 */
double CreditCard::getRate() const {
}

/** Return the up-to-the-minute balance.
 *  @return  up-to-the-minute balance (measured in cents).
 */
int CreditCard::getCurrentBalance() const {
}

/** Return the account balance as it existed at the conclusion of
 *  the most recent as of the end of the previous month.
 *  @return balance (measured in cents) as it existed at the end of
 *          the most recent call to processMonth
 */
int CreditCard::getStatementBalance() const {
}

/** Return the minimum payment ammount that was computed in the most
 *  recent call to processMonth.
 *  @return  most recently calculated minimum payment (in cents)
 */
int CreditCard::getMinPayment() const {
}

//////////////////////////////////////
// mutators
//////////////////////////////////////

/** Attempts to make a charge of given price against this card.
 *
 *  A charge should be disallowed if it would cause the credit limit
 *  to be exceeded.  All negative charges should be disallowed.
 *
 * @param  price  requested amount to be charged (in cents)
 * @return true if charge was allowed;  false if disallowed
 */
bool CreditCard::chargeIt(int price) {
}

/** Used to make a payment on behalf of the account holder.
 *
 *  A positive payment is used to pay off a portion of the current
 *  balance.  (if user pays off more than their current balance, the
 *  excess should still be credited in the form of a negative
 *  balance.)
 *
 *  Negative payments should be ignored.
 *
 * @param  payment  requested amount to be charged (in cents)
 */
void CreditCard::makePayment(int payment) {
}

/** This method performs all processing to reflect the typical end
 *  of a monthly cycle. It is used to assess any fees or interest
 *  which are incurred and to record a new minimum payment required
 *  for the coming month.
 *
 *  return the new minimum payment required (measured in cents)
 */
int CreditCard::processMonth() {
}


//////////////////////////////////////
// output function
//////////////////////////////////////

/** A standard format for displaying relevant account information.
 *
 *  Please do NOT alter this implementation.
 */
ostream& operator<<(ostream& out, const CreditCard& c) {
  int p = out.precision();
  out.precision(2);
  out << setiosflags(ios::fixed)
      << "Card Number =              " << c.getNumber() << endl
      << "Customer Name =            " << c.getName() << endl
      << "Monthly Interest Rate =    " << 100.0 * c.getRate() << "%" << endl
      << "Limit =                    " << "$" << c.getLimit() << endl
      << "Current Balance   =        " << "$" << c.getCurrentBalance()/100.0 << endl
      << "Recent Statement Balance = " << "$" << c.getStatementBalance()/100.0 << endl
      << "Min Payment Due =          " << "$" << c.getMinPayment()/100.0 << endl;
  out.precision(p);
  return out;
}