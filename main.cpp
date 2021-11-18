#include <iostream>

int test(int & i)
{
	if (i == 3)
	{

		return 500;
	}

	(i)++;

	test(i);


}




int main()
{
	std::cout << "Hello, World!" << std::endl;
	int a = 0;
	 test(a) ;
	std::cout << a << std::endl;




	return 0;
}
