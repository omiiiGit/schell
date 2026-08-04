#include "buck.h"

static wchar_t UPTRI[] =  L"\u25B6"; 
static wchar_t DOTRI[]  = L"\u25BC"; 

static struct buck_t
*create_buck_t(char *name)
{
	struct buck_t *buck = (struct buck_t*)malloc(sizeof *buck);

	buck->next = buck->prev = NULL;
	buck->is_extended = buck->is_selected = false;

	strcpy(buck->name,name);

	return buck;
}

static void 
shell()
{

}

void
create_buck_list(struct buck_list_t *self,int lines,int w, int y, int x,const char *name)
{
	*self = (struct buck_list_t)
	{
		.head = NULL,
		.tail = NULL,
		.selected = NULL,
		.start_buck = NULL,
		.lines = lines,
		.size = 0,
		.focus = false,
		.name = name,
		.win = NULL,
		.pos = 0,
	};

	self->win = newwin(lines+1,w,y,x);
	if(self->win == NULL)
	{
		printf("Failed to init bucks window\n");
		endwin();
		exit(EXIT_FAILURE);
	}
	keypad(self->win,TRUE);
}


void 
push_buck_to_list(struct buck_list_t *list,char *name)
{
	struct buck_t *buck = create_buck_t(name);

	if(list->size == 0)
	{
		list->head = buck;
		list->tail = buck;
		list->selected = buck;
		list->start_buck = buck;
		list->selected->is_selected = true;
	}
	else 
	{
		buck->prev = list->head;
		list->head->next = buck;
		list->head = buck;
	}
	list->size++;
}

int
free_buck_list(struct buck_list_t *list)
{
	struct buck_t *t = list->tail;
	int i = 0;

	while(t != NULL)
	{
		struct buck_t *next = t->next;
		free(t);
		t = next;
		i++;
	}

	return i;
}

void 
go_next_buck(struct buck_list_t *list)
{
	bool change = false;	

	list->selected->is_selected = false;
	list->selected->is_extended = false;

	if(list->selected->next == NULL)
	{
		list->selected = list->start_buck = list->tail;
		list->selected->is_selected = true;

		list->pos = 0;

		return;
	}

	if(list->pos >= list->lines - 2)
	{
		list->start_buck = list->selected->next;
		change = true;
	}


	list->selected = list->selected->next;
	list->selected->is_selected = true;
	list->pos = (change) ? 0 : list->pos + 1;
}

size_t 
show_buck_list(struct buck_list_t *list)
{
	if(list->size == 0)
		return 0;

	werase(list->win); wmove(list->win,0,0);

	struct buck_t *t;

	int y,x,foo,offset_len;
	int w_width,w_height;

	y = x = 0;
	foo = 1;

	t = list->start_buck;
	getmaxyx(list->win,w_height,w_width);

	(void)w_height;

	while(t != NULL && y != list->lines)
	{
		getyx(list->win,y,x);
		wmove(list->win,foo,1);

		if(t->is_selected)
		{
			chtype flag = COLOR_PAIR(BLACK_YELLOW) | A_BOLD;

			wchar_t *triangle = (t->is_extended) ? DOTRI : UPTRI;

			offset_len = (w_width - 2) - strlen(t->name);

			wattron(list->win,flag); 
			waddwstr(list->win,triangle); wprintw(list->win," %s",t->name);
		   	for(int i = 0;i < offset_len;i++)
				waddch(list->win,' ');
			waddch(list->win,'\n');
			wattroff(list->win,flag); 
			
		}
		else 
			wprintw(list->win,"%s\n",t->name);
		foo++;

		t = t->next;
	}

	chtype border_attr = (list->focus) ? COLOR_PAIR(GREEN_BLACK) : COLOR_PAIR(YELLOW_BLACK);

	wattron(list->win,border_attr | A_BOLD); box(list->win,0,0); wattroff(list->win,border_attr | A_BOLD);
	wattron(list->win,A_BOLD); mvwprintw(list->win,0,((w_width - strlen(list->name) - 1/2)/2),list->name); wattroff(list->win,A_BOLD);
	wrefresh(list->win);

	return list->size;
}

void
event_buck_list(struct buck_list_t *self,int c)
{
	if(!self->focus)
		return;

	switch(c)
	{
		case KEY_DOWN: case _KEY_J: go_next_buck(self); break;
		case KEY_UP: case _KEY_K: go_prev_buck(self); break;
		case _KEY_ENTER: toggle_is_extended(self->selected); break;
		case _CHAR_COLON: shell(); break;
		default: break;
	}

}

void 
go_prev_buck(struct buck_list_t *list)
{
	bool change = false;	

	list->selected->is_selected = false;
	list->selected->is_extended = false;

	if(list->selected->prev == NULL)
	{
		list->selected = list->head;
		list->selected->is_selected = true;

		struct buck_t *b = list->head;
		
		int foo = (list->size % list->lines == 0) ? list->lines : list->size % list->lines;

		for(int i = 0;i < foo - 1;i++)
		{
			b = b->prev;
		}
		list->start_buck = b;

		list->pos = foo - 2;

		return;	
	}

	if(list->pos == 0)
	{
		struct buck_t *buck = NULL; int i = 0;
		for(buck = list->selected; i <= list->lines - 1; i++)
		{
			if(buck->prev != NULL)
				buck = buck->prev;
		}
		list->start_buck = buck;

		change = true;
	}
	

	list->selected = list->selected->prev;
	list->selected->is_selected = true;
	list->pos = (change) ? list->lines - 1 : list->pos - 1;
}

void
toggle_is_extended(struct buck_t *buck)
{
	buck->is_extended = (buck->is_extended) ? false : true;
}

