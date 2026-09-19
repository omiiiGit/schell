#include "gui.h"
#include "widgets.h"

struct buck_list_t *bucks = NULL;
struct buck_list_t *dates = NULL;
Textbar *textbar = NULL;
int ec = 0;

bool is_debug = true;

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

static void
load_buck_dirs() 
{
	if (! empty_buck_list(bucks)) 
		return;

	char *strarr[1028];
	int sap = 0;

	int 
	cmp_files_by_mod(const void *a,const void *b) 
	{
		struct stat a_stat,b_stat;
		char *a_path,*b_path;
		const char *a_str = *(char**)a;
		const char *b_str = *(char**)b;
		
		asprintf(&a_path,"%s/%s",DIRPATH,a_str);
		asprintf(&b_path,"%s/%s",DIRPATH,b_str);

		if (lstat(a_path,&a_stat) != 0) 
			fprintf(stderr,"Foo has been happend");
		if (lstat(b_path,&b_stat) != 0)
			fprintf(stderr,"Foo has been happend");

		free(a_path);
		free(b_path);

		if (a_stat.st_mtime > b_stat.st_mtime)
			return -1;
		else if (a_stat.st_mtime < b_stat.st_mtime)
			return 1;

		return 0;

	}

	DIR *dir;
	struct dirent *de;

	if ((dir = opendir(DIRPATH)) == NULL) {
		fprintf(stderr,"Failed to load bucks for dir\n");
	}

	while ((de = readdir(dir)) != NULL) {
		if (strcmp(de->d_name,".") == 0 || strcmp(de->d_name,"..") == 0)
			continue;

		strarr[sap] = malloc(1028);
		strcpy(strarr[sap++],de->d_name);
	}

	qsort(strarr,sap,sizeof(char*),cmp_files_by_mod);

	for (int i = 0;i < sap;i++)
		push_buck_to_list(bucks,strarr[i]);

	for (int i = 0;i < sap;i++)
		free(strarr[i]);

	closedir(dir);

}

static void
load_dates_files() 
{
	if (!bucks->focus)
		return;

	if (! empty_buck_list(dates)) 
		return;

	char *buck_name = bucks->selected->name;

	DIR *dir;
	struct dirent *dp;
	char *path;

	asprintf(&path,"%s/%s",DIRPATH,buck_name);

	if ((dir = opendir(path)) == NULL) {
		fprintf(stderr,"Failed to load buck %s\n",buck_name);
		return;
	}

	while ((dp = readdir(dir)) != NULL) {
	
		if (strcmp(dp->d_name,".") == 0 || strcmp(dp->d_name,"..") == 0) 
			continue;

		push_buck_to_list(dates,dp->d_name);
	}

	free(path);
	closedir(dir);

}

#define X(first,second) \
	init_pair(first##_##second,COLOR_##first,COLOR_##second);
static void
gui_init_color(void)
{
	start_color();

	init_color(DWHITE,1000,1000,1000);
	init_color(DBLUE,0,0,1000);
	init_color(DGREEN,0,1000,0);

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

static void 
main_event(int c)
{

	switch (c) {
	case KEY_RESIZE:
		erase(); refresh(); move(0,0);
		break;
	case _CHAR_COLON:
		mvaddch(LINES-1,0,':' | COLOR_PAIR(DWHITE_DBLUE));
		refresh();

		int i = draw_textbar(textbar);

		mvaddch(LINES-1,0,' ' | COLOR_PAIR(BLACK_BLACK));	
		refresh();
		if (i > 0) parse_command();
		break;
	case KEY_RIGHT:
		bucks->focus = false;
		dates->focus = true;
		break;
	case KEY_LEFT:
		bucks->focus = true;
		dates->focus = false;
		break;
	}

	event_buck_list(bucks,c);
	event_buck_list(dates,c);

	load_dates_files();
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

	bucks = (struct buck_list_t*)malloc(sizeof(struct buck_list_t));
	create_buck_list(bucks,10,15,1,1,"BUCKS");
	bucks->focus = true;

	dates = (struct buck_list_t*)malloc(sizeof(struct buck_list_t));
	create_buck_list(dates,15,20,1,20,"DATES");
	dates->focus = false;

	textbar = create_textbar(stdscr,COLS-1,1,LINES-1,COLOR_PAIR(DWHITE_DBLUE),COLOR_PAIR(DBLUE_DWHITE));

	load_buck_dirs();
}

void 
run(void)
{

	do{		

		main_event(ec);	

		refresh();

		show_buck_list(bucks);
		show_buck_list(dates);

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
	free_buck_list(dates);

	free(bucks);
	free(dates);
}
