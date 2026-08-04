#include "gui.h"
#include "utils.h"
#include <stdlib.h>

int main(int argc,char *argv[])
{
	char name[128];
	char num[28];

	init_gui();

	for(int i = 0;i < 50;i++)
	{
		*name = '\0';
		snprintf(num,128,"%d",i);
		mystrcat(name,"buck-",num,NULL);
		
		push_buck_to_list(&bucks,name);
	}
	for(int i = 0;i < 50;i++)
	{
		*name = '\0';
		snprintf(num,128,"%d",i);
		mystrcat(name,"FONTO-",num,NULL);
		
		push_buck_to_list(&ab,name);
	}

	run();

	free_gui();

	return 0;
}
