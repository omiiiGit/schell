#include "gui.h"

struct buck_list_t bucks;
bool is_shell_executed = false;
bool is_debug = false;
int ec = -1;

static wchar_t UPTRI[] =  L"\u25B6"; 
static wchar_t DOTRI[]  = L"\u25BC"; 


static void
print_screen_info()
{
	char buffer[BUFFSIZE];

	attron(A_STANDOUT);
	sprintf(buffer,"Screen -> %d x %d",COLS,LINES);
	mvaddstr(0,COLS-strlen(buffer),buffer);
	sprintf(buffer,"Number of bucks-> %ld",bucks.size);
	mvaddstr(1,COLS-strlen(buffer),buffer);
	sprintf(buffer,"buffer -> %s",BUFFER);
	mvaddstr(2,COLS-strlen(buffer),buffer);
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
	int c,n;
	char *bp = BUFFER;

	c = n = 0;

	move(LINES-1,1); clrtoeol();
	attron(COLOR_PAIR(GREEN_BLACK));mvaddstr(LINES-1,0,":");attroff(COLOR_PAIR(GREEN_BLACK));

	while((c = getch()) != '\n' && c != _CHAR_ESC && n < BUFFSIZE-1 )
	{
		if(c == KEY_BACKSPACE && n > 0)
		{
			*--bp = '\0';
			n--;
		}
		else if(c != KEY_BACKSPACE)
		{	
			*bp++ = c;
			*bp = '\0';
			n++;
		}
		move(LINES-1,1); clrtoeol();
		addstr(BUFFER);	addch(' ' | COLOR_PAIR(WHITE_WHITE)); refresh();
	}

	if(c == _CHAR_ESC)
		return;

	if(strcmp(BUFFER,"q") == 0)
		ec = _CHAR_ESC;
	else if(strcmp(BUFFER,"debug") == 0)
		is_debug = (is_debug) ? false : true;
	else
	{
		move(LINES-1,1); clrtoeol();
		attron(COLOR_PAIR(RED_WHITE)); addstr("In valid command"); attroff(COLOR_PAIR(RED_WHITE)); refresh(); napms(500);

	}
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
	cbreak();
	noecho();
	curs_set(0);

	gui_init_color();

	bucks = create_buck_list();
}

void 
run()
{
	do{
		main_event(ec);	

		clear(); move(0,0);

		show_buck_list(&bucks);

		if(is_debug)
			print_screen_info();

	}while(ec != _CHAR_ESC && (ec = getch()) != 'q' );
}

void
free_gui()
{
	endwin();

	free_buck_list(&bucks);
}
