#include <stdio.h>
#include <ncurses.h>
#include "gui.h"

int main(int argc,char *argv[])
{
	init_gui();


	free_gui();

	return 0;
}
