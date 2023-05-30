#include <stdio.h>

main(void)
{
	int arraylength; //length of the array
	int i; //variable for loops	
	int sum = 0; 
	int average = 0;

	//initialize array length
	printf("Enter the number of grades:");
	scanf("%d",&arraylength);

	//create an array
	int grades[arraylength];

	//make a loop to enter grades
	printf("Enter the grades:");
	i = 0;
	while (i < arraylength)
	{
		scanf("%d", &grades[i]);
		i = i+1;
	}

	//compute the sum
	i = 0;
	while (i < arraylength)
	{
		sum = sum + grades[i];
		i = i+1;
	}

	//compute and print average
	average = sum/arraylength;
	printf("The average is %d\n", average);

	return 0;

}