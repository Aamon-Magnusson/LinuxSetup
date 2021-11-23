#include<stdio.h>

int main(){
	int age = 21;
	char name[5] = {'\0'};

	printf("Enter your name: ");
	scanf("%s",name);

	printf("Your name is %s and your age is %d\n", name, age);
}
