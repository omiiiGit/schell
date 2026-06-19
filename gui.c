#include "gui.h"

struct buck_list_t bucks;

static wchar_t UPTRI[] =  L"\u25B6"; 
static wchar_t DOTRI[]  = L"\u25BC"; 

#define X(first,second) \
	init_pair(first##_##second,COLOR_##first,COLOR_##second);
static void
gui_init_color()
{
	start_color();

	//initializing colors from CREATE_COLORS_FOR macro
	
	CREATE_COLORS_FOR(BLACK)
	CREATE_COLORS_FOR(RED)
	CREATE_COLORS_FOR(GREEN)
	CREATE_COLORS_FOR(YELLOW)
	CREATE_COLORS_FOR(BLUE)
	CREATE_COLORS_FOR(MAGENTA)
	CREATE_COLORS_FOR(CYAN)
	CREATE_COLORS_FOR(WHITE)
}
#undef X

static size_t 
show_buck_list(struct buck_list_t *list)
{

	if(list->size == 0)
	{
		printf("buck list is empty\n");

		return 0;
	}

	struct buck_t *t = list->tail;

	while(t != NULL)
	{
		if(t->is_selected)
		{
			chtype flag = COLOR_PAIR(BLACK_WHITE);

			wchar_t *triangle= (t->is_extended) ? DOTRI : UPTRI;

			attron(flag); addwstr(triangle); printw(" %s\n",t->name); attroff(flag); 
			
		}
		else 
			printw("%s\n",t->name);

		t = t->next;
	}

	return list->size;
}

void
init_gui()
{
	setlocale(LC_CTYPE,"en_US.UTF-8");

	initscr();
	keypad(stdscr,TRUE);
	noecho();

	gui_init_color();

	bucks = create_buck_list();
}

void 
run()
{
	int c;

	do{
		clear(); move(0,0);

		show_buck_list(&bucks);

	}while((c = getch()) != 'q');
}

void
free_gui()
{
	endwin();

	free_buck_list(&bucks);
}
