#include "gui.h"
#include <stdlib.h>

int main(int argc,char *argv[])
{

	char name[128];
	char num[28];


	init_gui();

	for(int i = 0;i < 20;i++)
	{
		*name = '\0';
		sprintf(num,"%d",i);
		strcat(name,"buck-"); strcat(name,num);

		push_buck_to_list(&bucks,name);
	}

	run();

	free_gui();

	return 0;
}
