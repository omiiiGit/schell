#include "gui.h"
#include "utils.h"
#include <stdlib.h>

int main(int argc,char *argv[])
{
	init_gui();

	run();

	free_gui();

	return 0;
}
