#include "buck.h"

static wchar_t UPTRI[] =  L"\u25B6"; 
static wchar_t DOTRI[]  = L"\u25BC"; 
//static wchar_t NETBAR[] = L"\u1FB90";

static struct buck_t
*create_buck_t(char *name)
{
	struct buck_t *buck = (struct buck_t*)malloc(sizeof *buck);

	buck->next = buck->prev = NULL;
	buck->is_extended = buck->is_selected = false;

	buck->index = 0;

	strcpy(buck->name,name);

	return buck;
}

static void
toggle_is_extended(struct buck_t *buck)
{
	buck->is_extended = (buck->is_extended) ? false : true;
}

static void
show_scroll_bar(struct buck_list_t *self, int w_width)
{
	if (self->size == 0)
		return;

	int w_height,i,scroll_len,scroll_pos;

	scroll_len = self->lines - 1;

	int percentage = (self->e_pos  * 100) / self->size ;
	scroll_pos = (scroll_len * percentage) / 100;	

	for(i = 0,w_height = 1;i < scroll_len ;i++,w_height++)
	{
		if(i == scroll_pos)
		{
			wattron(self->win,COLOR_PAIR(RED_BLACK)); mvwaddwstr(self->win,w_height,w_width,L"🮐"); wattroff(self->win,COLOR_PAIR(RED_BLACK));
		}
		else
			mvwaddch(self->win,w_height,w_width,ACS_VLINE);
	}
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
		.hide = false,
		.name = name,
		.win = NULL,
		.pos = 0,
		.e_pos = 0,
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
		buck->index = buck->prev->index + 1;
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
	if (list->size == 0)
		return;

	list->selected->is_selected = false;
	list->selected->is_extended = false;

	if(list->selected->next == NULL)
	{
		list->start_buck = list->tail;
		list->pos = 0;
		list->e_pos = 0;

		list->selected = list->start_buck;
		list->selected->is_selected = true;

		return;
	}

	int i;

	i = 0;

	if(list->pos == list->lines - 2)
	{
		list->pos = 0;

		while(list->start_buck != NULL && i < list->lines - 1)
		{
			list->start_buck = list->start_buck->next;
			i++;
		}

		goto skip_pos_next;
	}

	list->pos++;

skip_pos_next:
	list->selected = list->selected->next;
	list->selected->is_selected = true;
	list->e_pos++;

}

void 
go_prev_buck(struct buck_list_t *list)
{
	if (list->size == 0)
		return;

	list->selected->is_selected = false;
	list->selected->is_extended = false;

	if(list->selected->prev == NULL)
	{		
		list->selected = list->head;
		list->selected->is_selected = true;

		struct buck_t *b = list->head;
		
		int foo = list->size % (list->lines - 1);

		foo = (foo == 0) ? list->lines - 1 : foo;

		for(int i = 0;i < foo - 1;i++)
		{
			b = b->prev;
		}
		list->start_buck = b;

		list->pos = foo - 1;
		list->e_pos = list->size - 1;

		return;	

	}

	int i;

	i = 0;

	if(list->pos == 0)
	{
		list->pos = list->lines - 2;

		while(list->start_buck != NULL && i < list->lines - 1)
		{
			list->start_buck = list->start_buck->prev;
			i++;
		}

		goto skip_pos_prev;
	}

	list->pos--;

skip_pos_prev:

	list->selected = list->selected->prev;
	list->selected->is_selected = true;
	list->e_pos--;

}

size_t
show_buck_list(struct buck_list_t *list)
{
	if(list->hide)
		return 0;

	int y,x,foo,offset_len,w_width,w_height;
	struct buck_t *t = NULL;
	y = x = offset_len = 0;
	foo = 1;
	t = list->start_buck;
	getmaxyx(list->win,w_height,w_width);
	chtype border_attr = (list->focus) ? COLOR_PAIR(GREEN_BLACK) : COLOR_PAIR(YELLOW_BLACK);

	werase(list->win); wmove(list->win,0,0);

	if (list->size == 0) {

		wattron(list->win,border_attr | A_BOLD); box(list->win,0,0); wattroff(list->win,border_attr | A_BOLD);

		wattron(list->win,A_BOLD); mvwprintw(list->win,0,((w_width - strlen(list->name) - 1/2)/2),"%s",list->name); wattroff(list->win,A_BOLD);

		show_scroll_bar(list,w_width - 2);
	
		wrefresh(list->win);

		return 0;
	}

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

			waddwstr(list->win,triangle);
			
			wprintw(list->win," %s",t->name);

		   	for(int i = 0;i < offset_len;i++)
				waddch(list->win,' ');
			waddch(list->win,'\n');
			wattroff(list->win,flag); 
			
		}
		else	
		{
			wprintw(list->win,"%d %s\n",t->index,t->name);
		}
		t = t->next;
		foo++;
	}

	wattron(list->win,border_attr | A_BOLD); box(list->win,0,0); wattroff(list->win,border_attr | A_BOLD);

	wattron(list->win,A_BOLD); mvwprintw(list->win,0,((w_width - strlen(list->name) - 1/2)/2),"%s",list->name); wattroff(list->win,A_BOLD);

	show_scroll_bar(list,w_width - 2);
	
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
		case _KEY_ENTER:
					toggle_is_extended(self->selected); 
					break;
		default: break;
	}

}



