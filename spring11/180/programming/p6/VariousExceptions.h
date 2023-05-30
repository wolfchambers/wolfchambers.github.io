#ifndef VARIOUS_EXCEPTIONS_H
#define VARIOUS_EXCEPTIONS_H

#include <string>
#include <iostream>
using std::string;


/**
 * Generic Exception class
 */
class RuntimeException {  
private:
  string errorMsg;
public:
  RuntimeException(const string& err) { errorMsg = err; }
  string getMessage() const { return errorMsg; }
};


inline std::ostream& operator<<(std::ostream& out, const RuntimeException& e)
{ return out << e.getMessage(); }



/**
 * Exception thrown when trying to move beyond an extreme of a container
 */
class BoundaryViolationException : public RuntimeException {  
public:
  BoundaryViolationException(const string& err) : RuntimeException(err) {}
};


/**
 * Exception thrown when asking for Position of empty list
 */
class EmptyContainerException : public RuntimeException {  
public:
  EmptyContainerException(const string& err) : RuntimeException(err) {}
};


/**
 * Exception thrown when sending an invalid position as a parameter to a Positional container
 */
class InvalidPositionException : public RuntimeException {  
public:
  InvalidPositionException(const string& err) : RuntimeException(err) {}
};


/**
 * Exception thrown when constructing an expression tree based upon an invalid expression.
 */
class InvalidExpressionException : public RuntimeException {  
public:
  InvalidExpressionException(const string& err) : RuntimeException(err) {}
};


#endif
