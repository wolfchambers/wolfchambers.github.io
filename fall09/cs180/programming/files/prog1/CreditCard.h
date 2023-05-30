#ifndef CREDIT_CARD_H                           // avoid repeated expansion
#define CREDIT_CARD_H

#include <string>                               // provides string
#include <iostream>                             // provides ostream

/** Represents a credit card record with a monthly billing cycle */
class CreditCard {


// PLEASE DO NOT MAKE ANY CHANGES TO THE PUBLIC PORTION.
// ALL OF YOUR MODIFICATIONS SHOULD BE KEPT PRIVATE (see end)

public:

  /** Construct a new credit card.
   *
   *  @param  no   the credit card number (expressed as a string)
   *  @param  nm   the card-holder's name
   *  @param  lim  maximum limit for card (expressed in dollars)
   *  @param  rt   A fraction which represents the monthly interest rate
   *  @param  bal  Initial balance for this account (expressed in cents)
   */
  CreditCard(std::string no, std::string nm, int lim, double rt, int bal=0);

  //////////////////////////////////////
  // accessors functions
  //////////////////////////////////////

  /** Return the card number.
   *  @return  string representing the card number
   */
  std::string getNumber() const;

  /** Return the name of the card holder.
   *  @return  person's name as a string
   */
  std::string getName() const;

  /** Return the credit limit.
   *  @return  limit (expressed in dollars)
   */
  int getLimit() const;

  /** Return the interest rate.
   *  @return  monthly interest rate (e.g. 0.0079 for 0.79% monthly rate)
   */
  double getRate() const;

  /** Return the up-to-the-minute balance.
   *  @return  up-to-the-minute balance (measured in cents).
   */
  int getCurrentBalance() const;

  /** Return the account balance as it existed at the conclusion of
   *  the most recent as of the end of the previous month.
   *  @return balance (measured in cents) as it existed at the end of
   *          the most recent call to processMonth
   */
  int getStatementBalance() const;

  /** Return the minimum payment ammount that was computed in the most
   *  recent call to processMonth.
   *  @return  most recently calculated minimum payment (in cents)
   */
  int getMinPayment() const;

  //////////////////////////////////////
  // update functions
  //////////////////////////////////////

  /** Attempts to make a charge of given price against this card.
   *
   *  A charge should be disallowed if it would cause the credit limit
   *  to be exceeded.  All negative charges should be disallowed.
   *
   * @param  price  requested amount to be charged (in cents)
   * @return true if charge was allowed;  false if disallowed
   */
  bool chargeIt(int price);

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
  void makePayment(int payment);

  /** This method performs all processing to reflect the typical end
   *  of a monthly cycle. It is used to assess any fees or interest
   *  which are incurred and to record a new minimum payment required
   *  for the coming month.
   *
   *  return the new minimum payment required (measured in cents)
   */
  int processMonth();


private:
  // ADD WHATEVER MEMBERS YOU WISH TO SUPPORT THE CLASS









};


/** A standard format for displaying relevant account information.
 *
 *  Please do NOT alter this signature.
 */
std::ostream& operator<<(std::ostream& out, const CreditCard& c);
#endif