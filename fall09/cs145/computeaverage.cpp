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

//Write a program to compute the average of a list of numbers
cout << "Enter the number of numbers: ";
cin >> n;

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

cout << "The average of your numbers is " << average << endl;

}
