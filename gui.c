#include "gui.h"

struct buck_list_t bucks;

bool is_shell_executed = false;

static wchar_t UPTRI[] =  L"\u25B6"; 
static wchar_t DOTRI[]  = L"\u25BC"; 


static void
print_screen_info()
{

	attron(A_STANDOUT);
	sprintf(BUFFER,"Screen -> %d x %d",COLS,LINES);
	mvaddstr(0,COLS-BLEN,BUFFER);
	sprintf(BUFFER,"Number of bucks-> %ld",bucks.size);
	mvaddstr(1,COLS-BLEN,BUFFER);
	attroff(A_STANDOUT);

	move(0,0);
}


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
			chtype flag = COLOR_PAIR(BLACK_YELLOW);

			wchar_t *triangle= (t->is_extended) ? DOTRI : UPTRI;

			attron(flag); addwstr(triangle); printw(" %s\n",t->name); attroff(flag); 
			
		}
		else 
			printw("%s\n",t->name);

		t = t->next;
	}

	refresh();

	return list->size;
}

static void
shell()
{
	echo();
	char *bp;
	int c;

	move(LINES-1,0);
	bp = BUFFER;

	attron(COLOR_PAIR(GREEN_BLACK));printw(":");attroff(COLOR_PAIR(GREEN_BLACK));
	while((c = getch()) != '\n' && c != _CHAR_ESC )
	{
		*bp++ = c;	
	}
	*bp = '\0';

	noecho();
}

static void 
main_event(int c)
{
	if(c == KEY_DOWN)
	{
		go_next_buck(&bucks);	
	}
	else if(c == KEY_UP)
	{
		go_prev_buck(&bucks);	
	}
	else if(c == _KEY_ENTER)
	{
		toggle_is_extended(bucks.selected);
	}
	else if(c == _CHAR_COLON)
	{
		shell();
	}
}

void
init_gui()
{
	setlocale(LC_CTYPE,"en_US.UTF-8");

	initscr();
	keypad(stdscr,TRUE);
	noecho();
	curs_set(0);

	gui_init_color();

	bucks = create_buck_list();
}

void 
run()
{
	int c = -1;

	do{
		main_event(c);	

		clear(); move(0,0);

		show_buck_list(&bucks);
		print_screen_info();

	}while((c = getch()) != 'q' && c != _CHAR_ESC);
}

void
free_gui()
{
	endwin();

	free_buck_list(&bucks);
}
