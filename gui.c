#include "gui.h"

struct buck_list_t bucks;
struct buck_list_t ab;

bool is_shell_executed = false;
bool is_debug = true;
int ec = -1;

static int screen_width;
static int screen_height;

static void
print_screen_info()
{
	char buffer[BUFFSIZE];

	attron(A_STANDOUT);
	//sprintf(buffer,"Screen -> %d x %d",COLS,LINES);
	sprintf(buffer,"Screen -> %d x %d",screen_height,screen_width);
	mvaddstr(0,COLS-strlen(buffer),buffer);
	sprintf(buffer,"Number of bucks-> %ld",bucks.size);
	mvaddstr(1,COLS-strlen(buffer),buffer);
	sprintf(buffer,"buffer -> %s",BUFFER);
	mvaddstr(2,COLS-strlen(buffer),buffer);
	sprintf(buffer,"List screen pos -> %d",bucks.pos);
	mvaddstr(3,COLS-strlen(buffer),buffer);
	attroff(A_STANDOUT);

	move(0,0);
}

static bool
is_screen_resize()
{
	return (screen_height != LINES || screen_width != COLS) ? true : false;
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

/*static void
shell()
{
	int c,n;
	char *bp = BUFFER;

	c = n = 0;

	move(LINES-1,1); clrtoeol();
	attron(COLOR_PAIR(GREEN_BLACK));mvaddstr(LINES-1,0,":");attroff(COLOR_PAIR(GREEN_BLACK));

	while((c = getch()) != '\n' && c != _CHAR_ESC && n < BUFFSIZE-1 )
	{
		if(c == '\t')
		{
		}
		else if(c == KEY_BACKSPACE && n > 0)
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
}*/

static void 
main_event(int c)
{
	if(is_screen_resize())
	{
		erase(); refresh(); move(0,0);
	}

	event_buck_list(&bucks,c);
	event_buck_list(&ab,c);


	if(c == KEY_RIGHT)
	{
		bucks.focus = false;
		ab.focus =true;
	}
	else if(c == KEY_LEFT)
	{
		bucks.focus = true;
		ab.focus = false;
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

	create_buck_list(&bucks,20,20,5,5,"FOO");
	bucks.focus = true;
		
	create_buck_list(&ab,20,25,5,40,"HELIOS");
}

void 
run()
{

	do{		

		main_event(ec);	

		refresh();

		show_buck_list(&bucks);
		show_buck_list(&ab);

		if(is_debug)
			print_screen_info();

		screen_height = LINES;
		screen_width = COLS;

	}while(ec != _CHAR_ESC && (ec = getch()) != 'q' );
}

void
free_gui()
{
	endwin();

	free_buck_list(&bucks);
}
