#include "guilist.h"

static void
show_scroll_bar(GuiList *self)
{
	if (self->pos == 0)
		return;

	int w_height,w_width,i,scroll_len,scroll_pos;

	scroll_len = self->h - 2;
	w_width = self->w - 2;

	int percentage = (self->selected_index * 100) / self->pos ;
	scroll_pos = (scroll_len * percentage) / 100;	

	for(i = 0,w_height = 1;i < scroll_len ;i++,w_height++)
	{
		if(i == scroll_pos)
		{
			//wattron(self->win,COLOR_PAIR(RED_BLACK)); mvwaddwstr(self->win,w_height,w_width,L"🮐"); wattroff(self->win,COLOR_PAIR(RED_BLACK));
			wattron(self->win,COLOR_PAIR(RED_RED)); mvwaddch(self->win,w_height,w_width,' '); wattroff(self->win,COLOR_PAIR(RED_RED));
		}
		else
			mvwaddch(self->win,w_height,w_width,ACS_VLINE);
	}
}

static void
draw_guilist(GuiList *self)
{

	int x,y,len;
	char *label;
	x = y = 1;

	for (int i = self->start_index;i < self->end_index && i >= 0 &&i < self->pos;i++,y++) {

		len = strlen(self->arr[i]);
	
		label = self->arr[i];

		if (i == self->selected_index ) {
			wattron(self->win,A_STANDOUT); mvwaddstr(self->win,y,x,label); wattroff(self->win,A_STANDOUT);

			len = (len > self->w - 2) ? 0 : self->w - 2 - len;	
			while (len) {
				waddch(self->win,' ' | A_STANDOUT);
				len--;
			}

		}
		else
			mvwaddstr(self->win,y,x,label);

	}

	wattron(self->win,(self->focus) ? COLOR_PAIR(GREEN_BLACK) : A_NORMAL ); box(self->win,0,0); wattroff(self->win,(self->focus) ? COLOR_PAIR(GREEN_BLACK) : A_NORMAL);
	if (self->name != NULL) {
		wattron(self->win,A_BOLD); mvwprintw(self->win,0,((self->w - strlen(self->name))/2),"%s",self->name); wattroff(self->win,A_BOLD);
	}
	show_scroll_bar(self);

	wrefresh(self->win);
}

void
init_guilist(GuiList *self,size_t size,int h,int w,int y,int x)
{
	self->arr = (char**)malloc(sizeof(char*) * size);

	if (self->arr == NULL)
		return;	

	memset(self->arr,0,sizeof(char*) * size);

	self->pos = 0;
	self->tsize = size;

	self->h = h;
	self->w = w;
	self->y = y;
	self->x = x;

	self->selected_index = 0;
	self->start_index = 0;
	self->end_index = self->h - 2;

	self->e_pos = 0;

	self->focus = false;
	self->hide = false;
	self->change = true;

	self->is_ele_deleted = false;
	self->is_ele_added = false;

	self->is_ele_pos_changed = false;

	self->name = NULL;

	//self->win = derwin(stdscr,h,w,y,x);
	self->win = newwin(h,w,y,x);
	if (self->win == NULL) {
		fprintf(stderr,"Failed to load window\n");
		return;
	}

	keypad(self->win,TRUE);
}

void 
push_opt_guilist(GuiList *self,char *s)
{
	int len = strlen(s);
	
	if (self->pos >= self->tsize) {
		if ( (self->arr = realloc(self->arr,sizeof(char*) * (self->tsize+10)) ) == NULL ) {
			fprintf(stderr,"Failed to increase char* array\n");
			
			exit(EXIT_FAILURE);
		}
		self->tsize += 10;
	}

	self->arr[self->pos] = (char*)malloc(len+1);

	char *str = self->arr[self->pos++];

	while (*s != '\0')
		*str++ = *s++;
	*str = '\0';

}

void 
updates_guilist(GuiList *self,int c)
{
	if (!self->focus)
		goto skip_event;

	switch(c) {
	case KEY_UP:
			if (self->selected_index == 0)
				break;

			self->selected_index--;

			if (self->selected_index >= (self->h - 2) - 4) {
				self->start_index -= 1;
				self->end_index -= 1;

			} else
				self->e_pos--;

			self->change = true;
			self->is_ele_pos_changed = true;

			break;
	case KEY_DOWN:
			if (self->selected_index == self->pos - 1)
				break;

			self->selected_index++;

			if (self->e_pos >= (self->h - 2) - 4) {
				self->start_index += 1;
				self->end_index += 1;

			} else
				self->e_pos++;

			self->change = true;
			self->is_ele_pos_changed = true;

			break;
	default: break;
	}	

skip_event:

	if (self->change) {
		werase(self->win);
		draw_guilist(self);

		self->change = false;
		self->is_ele_added = false;
	}

}

void
print_guilist(GuiList *self)
{
	for (int i = 0;i < self->pos;i++) {
		printw("%s\n",self->arr[i]);
	}
}

void 
empty_guilist(GuiList *self)
{
	for (int i = 0;i < self->pos;i++) 
		free(self->arr[i]);
	self->pos = 0;
}

void
free_guilist(GuiList *self)
{
	for (int i = 0;i < self->pos;i++) 
		free(self->arr[i]);
	free(self->arr);
}
