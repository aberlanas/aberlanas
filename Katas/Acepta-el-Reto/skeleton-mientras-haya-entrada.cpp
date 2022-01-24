#include <iostream>
#include <string>
using namespace std;

// si son numeros
int leerNumeros(){
	int n;
	while (cin >> n){
		cout << n << endl;
	}
	return 0;
}

// si son strings
int leerStrings(){
	string line;
	while (getline(cin, line)){
		cout << line << endl;

	}
	return 0;
}

// si son caracteres
int leerCaracteres(){
	char c;
	while (cin.get(c))
	{
	   cout << c << endl;
	}

	return 0;
}

int main () {

	// si son caracteres
	//leerCaracteres();
	//leerStrings();
	leerNumeros();

}
