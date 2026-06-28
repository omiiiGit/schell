#include "gui.h"
#include "utils.h"
#include <stdlib.h>

int main(int argc,char *argv[])
{
	char name[128];
	char num[28];

	init_gui();

	for(int i = 0;i < 70;i++)
	{
		*name = '\0';
		sprintf(num,"%d",i);
		mystrcat(name,"buck-",num,NULL);
		
		push_buck_to_list(&bucks,name);
	}

	run();

	free_gui();

	return 0;
}
