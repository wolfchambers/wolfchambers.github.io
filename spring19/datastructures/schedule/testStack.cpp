#include "ArrayStack.h"
#include <iostream>
using namespace std;

int main() {
	ArrayStack<char> S;

	S.push('a');
	S.push('b');
	S.push('c');

	cout << "My stack has " << S.size() << " elements:" << endl;

	while (!S.empty()) {
		cout << S.top() << " ";
		S.pop();
	}

	cout << endl;

	return 0;
}
