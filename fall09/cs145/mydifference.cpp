//standard header
#include <cmath>
#include <fstream>
#include <iostream>
using namespace std;

main () {
	//variable declarations
	int x;
	int y;
	int difference;
	
	cout << "Enter a number: ";
	cin >> x;
	cout << "Enter another number: ";
	cin >> y; 
	difference = x - y;

	//print out difference
	cout << "The difference is " << difference << "." << endl;
	cout << "The sum is " << x+y << "." << endl;
}
