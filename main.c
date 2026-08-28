#include "gui.h"
#include "utils.h"
#include <stdlib.h>

int main(int argc,char *argv[])
{
	init_gui();

	for(int i = 0;i < 100;i++)
	{
		push_buck_to_list(bucks,"Buck");
	}

	run();

	free_gui();

	return 0;
}
