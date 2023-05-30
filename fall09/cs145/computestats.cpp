//standard header
#include <cmath>
#include <fstream>
#include <iostream>
using namespace std;

main() {

//variable declaration
double average;
double sum;
int n;
double maximum;
double minimum;

//Write a program to compute the average of a list of numbers, as well as max and min
cout << "Enter the number of numbers: ";
cin >> n;

if (n>0) {

	//create an array
	double numbers[n];

	for (int i=0; i < n; i = i + 1) {
		cin >> numbers[i];
	}

	//loop to compute average
	sum  = 0;
	for (int i=0; i < n; i=i+1) {
		sum = sum + numbers[i];
	}
	average = sum/double(n);

	//compute max
	maximum = numbers[0];
	for (int i=1; i < n; i=i+1) {
		if (maximum < numbers[i]) {
			maximum = numbers[i];
		} //end if
	} //end for

	//compute min
	minimum = numbers[0];
	for (int i=1; i < n; i=i+1) {
		if (minimum > numbers[i]) {
			minimum = numbers[i];
		} //end if
	} //end for

	cout << "The average of your numbers is " << average << endl;
	cout << "The maximum of your numbers is " << maximum << endl;
	cout << "The minimum of your numbers is " << minimum << endl;
} //end if
else {
	cout << "You fail!  Try a positive integer next time." << endl;
}

}
