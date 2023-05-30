#include <iostream>
#include <fstream>
#include <cmath>
using namespace std;

double convert(double fah) {
	return (5.0/9)*(fah-32);
}

main () {
	double f;
	double c;

	cout << "Enter a temperature in degrees F: ";
	cin >> f;

	c = convert(f);

	cout << "That is equivalent to " << c << " degrees C" << endl;
}
