#include "gui.h"
#include "widgets.h"

//struct buck_list_t bucks;
struct buck_list_t *bucks;
Textbar *textbar = NULL;

bool is_shell_executed = false;
bool is_debug = true;
int ec = -1;

static int screen_width;
static int screen_height;

void
print_screen_info(void)
{
	char buffer[BUFFSIZE];

	attron(A_STANDOUT);
	//sprintf(buffer,"Screen -> %d x %d",COLS,LINES);
	sprintf(buffer,"Screen -> %d x %d",screen_height,screen_width);
	mvaddstr(0,COLS-strlen(buffer),buffer);
	sprintf(buffer,"Number of bucks-> %ld",bucks->size);
	mvaddstr(1,COLS-strlen(buffer),buffer);
	sprintf(buffer,"buffer -> %s",BUFFER);
	mvaddstr(2,COLS-strlen(buffer),buffer);
	sprintf(buffer,"buck pos -> %d",bucks->pos);
	mvaddstr(3,COLS-strlen(buffer),buffer);
	sprintf(buffer,"buck element pos -> %d",bucks->e_pos);
	mvaddstr(4,COLS-strlen(buffer),buffer);
	attroff(A_STANDOUT);

	refresh();

	move(0,0);
}

static bool
is_screen_resize(void)
{
	return (screen_height != LINES || screen_width != COLS) ? true : false;
}

#define X(first,second) \
	init_pair(first##_##second,COLOR_##first,COLOR_##second);
static void
gui_init_color(void)
{
	start_color();

	init_color(DWHITE,1000,1000,1000);
	init_color(DBLUE,0,0,1000);

	//initializing colors from CREATE_COLORS_FOR macro
	
	CREATE_COLORS_FOR(BLACK)
	CREATE_COLORS_FOR(RED)
	CREATE_COLORS_FOR(GREEN)
	CREATE_COLORS_FOR(YELLOW)
	CREATE_COLORS_FOR(BLUE)
	CREATE_COLORS_FOR(MAGENTA)
	CREATE_COLORS_FOR(CYAN)
	CREATE_COLORS_FOR(WHITE)

	init_pair(DWHITE_DBLUE,DWHITE,DBLUE);
	init_pair(DBLUE_DWHITE,DBLUE,DWHITE);

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

	if (c == KEY_RESIZE) {
		erase(); refresh(); move(0,0);
	}

	event_buck_list(bucks,c);

	if (c == _CHAR_COLON) {
		mvaddch(LINES-1,0,':' | COLOR_PAIR(DWHITE_DBLUE));
		refresh();
		draw_textbar(textbar);
		mvaddch(LINES-1,0,' ' | COLOR_PAIR(BLACK_BLACK));	
		refresh();
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

	//getmaxyx(stdscr,screen_height,screen_width);
	screen_height = LINES;
	screen_width = COLS;

	bucks = (struct buck_list_t*)malloc(sizeof(struct buck_list_t));
	create_buck_list(bucks,10,15,1,1,"BUCKS");
	bucks->focus = true;

	textbar = create_textbar(stdscr,COLS-1,1,LINES-1,COLOR_PAIR(DWHITE_DBLUE),COLOR_PAIR(DBLUE_DWHITE));

}

void 
run(void)
{

	do{		

		main_event(ec);	

		refresh();

		show_buck_list(bucks);

		if(is_debug)
			print_screen_info();

		screen_height = LINES;
		screen_width = COLS;

	}while(ec != _CHAR_ESC && (ec = getch()) != 'q' );
}

void
free_gui(void)
{
	endwin();

	free_buck_list(bucks);
	free(bucks);
}
