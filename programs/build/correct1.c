/* program  big */
#include "ptuclib.h"
int i, j, k, l, m, n;
char* mystring;
double firstArray[300][200][100],  secondArray[300][200][100];
void nl(){
	writeString("\n");
}
void compute(int n, int k){
int cube(int i){
	int result;
	result = i * i * i;
	return result;
}
void computeWithForLoops(){
int sum;
	sum = 0;
	for(int l=0; l<=300; l++){
	for(int m=200; m>=0; m--){
	sum = sum + cube(200) / cube(200);
	}
	if(l % 100 == 0){
	writeString(".");
	}
	}
	nl();
	mystring = "Sum = ";
	writeString(mystring);
	writeInteger(sum);
	nl();
	if(sum % 2 == 0){
	writeString("Sum is Even");
	}else{
	writeString("Sum is Odd");
	}
	nl();
	if(sum * 2 % 3 == 0){
	writeString("Sum*2 is divisible with \"3\"");
	}else{
	if(sum * 2 % 3 == 1){
	writeString("Sum*2 has a remainder of \"1\" when divided with \"3\"");
	}else{
	writeString("Sum*2 has a remainder of \"2\" when divided with \"3\"");
	}
	}
	nl();
}
	computeWithForLoops();
}
int promptForInteger(char* prompt){
	int result;
	writeString(prompt);
	result = readInteger();
	writeString("You typed: ");
	writeInteger(result);
	nl();
	return result;
}
int main() {
	k = promptForInteger("Type a number: ");
	i = promptForInteger("Type another number: ");
	compute(k,i);
	goto myLabel;
	mystring = "This should not be shown";
	writeString(mystring);
	myLabel: 	mystring = "Goto Works Fine!";
	writeString(mystring);
	return 0;
}
