#include <iostream>
#include <string>
#include <algorithm>
#include <cctype>

using namespace std;
std::string line="";


bool loes(int start, int end){
    if (start >= end){
        return true;
    }else{
        if (line[start] == ' '){
            return loes(start+1,end);
        }
        if (line[end] == ' '){
            return loes(start,end-1);
        }
        if (std::tolower(line[start]) == std::tolower(line[end])){
            return loes(start+1,end-1);
        }else{

            return false;
        }

    }
}


int main(){

    while (getline(cin, line) && line != "XXX"){

        if (loes(0,line.length()-1)){
            cout << "SI" << endl;
        }else{
            cout << "NO" << endl;
        }
    
    }

}