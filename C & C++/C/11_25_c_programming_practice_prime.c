#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <math.h> // 수학과 관련된 기능을 담고 있음  → 제곱근을 구하는 함수(sqrt)를 사용하기 위해 씀
/*
int main() {

	//----------------------------------------------------------
	// 내가 한 풀이

	// 연습문제 (4): 사용자에게 양의 정수를 입력받아 이 숫자가 소수(prime)인지 아닌지 확인하는 프로그램을 작성하라
	// → 소수(prime): 양의 약수가 1과 자기 자신 뿐인 1보다 큰 자연수

	int num;

	while (1) {

		printf("Enter an integers: ");
		scanf("%d", &num);

		if ((num / 1 == num) && (num / num == 1))
			break;
		printf("%d is a prime number!\n", num);
	}
	printf("%d is NOT a prime number!\n", num);


	return 0;
}
*/

//----------------------------------------------------------------------------------
/*
int main () {

	// 수업시간에 한 풀이

	// 연습문제 (4): 사용자에게 양의 정수를 입력받아 이 숫자가 소수(prime)인지 아닌지 확인하는 프로그램을 작성하라

	// → 소수(prime): 양의 약수가 1과 자기 자신 뿐인 1보다 큰 자연수
	// → 1과 자기 자신으로만 나누어 떨어지는 수
	// → 1과 자기 자신을 제외한 다른 수로는 나누어 떨어지지 않는 수
	// → 2부터 사용자가 입력한 값보다 작은 자연수로 사용자가 입력한 값을 나눠보고
	//	 그 나머지가 0인 자연수가 나오면 사용자가 입력한 값은 소수가 아니다.

	int i, num;

	// 상태 변수(flag variable): 어떤 상태를 나타내기 위해 사용하는 변수
	// 사용자가 입력한 값이 소수인지 아닌지 판별하는 변수
	// → 사용자가 입력한 값이 소수이면 1, 아니면 0으로 저장
	// → 일단 사용자가 입력한 값을 소수라고 가정하고 아래에서 사용자가 입력한 값이 소수가 아닌 경우만 확인한다.
	int is_prime = 1;

	printf("Enter an integers: ");
	scanf("%d", &num);

	// 어떤 수의 제곱근까지의 자연수로 나눠보면 소수인지 아닌지 확인할 수 있다.
	// for (i = 2; i < num; i++)
	for (i = 2; i <= sqrt(num); i++)
		if (num % i == 0)
		{
			is_prime = 0;

			// 이미 소수라는 것을 확인했으므로 반복문을 더 이상 수행할 이유가 없다
			// → break문은 조건문과 관계가 없다.
			//	 break문을 만나면 가장 가까이에 있는 반복문을 벗어난다.
			break;
		}

	// 출력
	printf("\n");

	if (is_prime)
		printf("%d is a prime number.\n", num);
	else
		printf("%d is NOT a prime number.\n", num);



	return 0;

}
*/


