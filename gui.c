#include "gui.h"

static void
init_gui()
{
	init_scr();
	keypad(stdscr,TRUE);
	noecho();
}

static void
free_gui()
{
	getch();
	endwin();
}
