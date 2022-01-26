#include <iostream>
#include <string>
#include <algorithm>

using namespace std;
std::string numerogirao="";

string usandobucle(int num){

    /* Caso base */
    if (num <= 5){
        return std::to_string(num);
    }else{
        string resto = std::to_string(num % 6);
        return resto + usandobucle(num/6);
    }          
    
}



int main() {

    int ncasos ;
    cin >> ncasos;

    int num = 0;

    while (ncasos--){

        numerogirao="";
        cin >> num;
        string salida = usandobucle(num);
        std::reverse(salida.begin(),salida.end());
        cout << salida << endl;

    }


}