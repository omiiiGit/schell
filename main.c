#include "gui.h"
#include "utils.h"
#include <stdlib.h>

int main(int argc,char *argv[])
{
	init_gui();
	
	char *s;

	for(int i = 0;i < 5;i++)
	{
		asprintf(&s,"Buck_%d",i);
		push_buck_to_list(bucks,s);
		free(s);
	}

	run();

	free_gui();

	return 0;
}
