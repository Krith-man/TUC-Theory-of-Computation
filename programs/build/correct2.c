/* program  function_fun */
#include "ptuclib.h"
char* mystring;
double firstArray[300][200],  secondArray[300][200];
void nl(){
	writeString("\n");
}
int fibonacci(int n){
	int result;
int f0, f1, temp;
	f0 = 0;
	f1 = 1;
	while(n > 1){
	temp = f1;
	f1 = f1 + f0;
	f0 = temp;
	n = n - 1;
	}
	result = f1;
	return result;
}
int factorial(int n){
	int result;
int fac, i;
	fac = 1;
	for(i=n; i>=1; i--){
	fac = i * fac;
	}
	result = fac;
	return result;
}
void eval(char* prompt, int (*f)(int n), int val){
	writeString(prompt);
	writeString("(");
	writeInteger(val);
	writeString(")=");
	writeInteger(f(val));
	writeString("\n");
}
void compute(){
int cube(int i){
	int result;
	result = i * i * i;
	return result;
}
void computeWithWhileLoops(){
int sum, l, m;
	sum = 0;
	l = 0;
	while(l <= 300){
	m = 0;
	do{
	sum = sum + cube(200) / cube(200);
	firstArray[l][m] = l;
	secondArray[l][m] = m;
	m = m + 1;
	}while(m <= 200);
	if(l % 100 == 0){
	writeString(".");
	}
	l = l + 1;
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
	computeWithWhileLoops();
}
int main() {
	eval("Fibonacci",fibonacci,5);
	eval("factorial",factorial,5);
	compute();
	return 0;
}
