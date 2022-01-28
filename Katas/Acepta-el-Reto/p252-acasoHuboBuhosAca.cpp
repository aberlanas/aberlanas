#include <iostream>
#include <string>
#include <algorithm>
#include <cctype>

using namespace std;
std::string origs="acaso hubo buhos aca";


int main(){

    string line;
    while (getline(cin, line) && line != "XXX"){
    
        
        while (line.find_last_of(" ")!= string::npos ){
            line.erase(line.find_last_of(" "),1);
        }

        std::transform(line.begin(), line.end(), line.begin(),
            [](unsigned char c){ return std::tolower(c); });
        
        string aux = line;
        std::reverse(line.begin(), line.end());

        if (aux == line){
            cout << "SI" << endl;
        }else{
            cout << "NO" << endl;
        }
    
        
        }

}