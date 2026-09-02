#include "textbar.h"
#include "widgets.h"

static
void addch_textbar(Textbar *self,int pos,int ch)
{

	char *buffer = self->buffer;

	if (pos > strlen(buffer) || pos < 0)
		return;

	char a = buffer[pos];
	int foo = pos;

	while (buffer[pos] != '\0') {
		char temp = buffer[pos + 1];
		buffer[pos + 1] = a;
		a = temp;
		pos++;
	}

	buffer[foo] = ch;

}

static void 
delch_textbar(Textbar *self,int pos)
{
	if (pos > strlen(self->buffer) || pos < 0)
		return;

	char *b = self->buffer + pos - 1;

	while(*b != '\0') {
		*b = *(b + 1);
		b++;
	}
}

Textbar
*create_textbar(WINDOW *parent,int w,int x,int y,chtype bar_color,chtype curs_color)
{
	Textbar *self = (Textbar*)malloc(sizeof(Textbar));

	*self = (Textbar) {
		.w = w,.h = 1,
		.x = x,.y = y,
		.curs_pos = 0,
		.start_pos = 0,
		//.win = derwin(parent,1,w,y,x),
		.win = newwin(1,w,y,x),
		.bar_color = bar_color,
		.curs_color = curs_color,
	};

	if (self->win == NULL) {
		endwin();
		printf("Failed to init textbar at %d\n",__LINE__);
		exit(EXIT_FAILURE);
	}

	keypad(self->win,TRUE);
	wbkgd(self->win,self->bar_color);
	wbkgdset(self->win,self->bar_color);

	return self;
}

void
draw_textbar(Textbar *self)
{
	int c;

	for (int i = 0;i < BUFFSIZE;i++)
		self->buffer[i] = '\0';

	self->curs_pos = 0;
	self->start_pos = 0;

	wbkgd(self->win,self->bar_color);

	curs_set(1);

	while ((c = wgetch(self->win)) != '\n') {
		werase(self->win);
		wmove(self->win,0,0);

		if (c == KEY_LEFT) {
			if (self->curs_pos >= (int)self->w)
				self->start_pos--;

			if (self->curs_pos >= 1)
				self->curs_pos--;
			goto render;
		}
		else if (c == KEY_RIGHT) {

			if (self->curs_pos == (int)strlen(self->buffer))
				goto render;

			if(self->curs_pos >= (int)self->w - 1)
				self->start_pos++;

			self->curs_pos++;
			goto render;
		}
		else if (c == KEY_BACKSPACE) {

			if (self->curs_pos == 0)
				goto render;

			if (self->curs_pos >= (int)self->w) {
				self->start_pos--;
			}

			delch_textbar(self,self->curs_pos--);

			goto render;

		}
		else if (c == KEY_RESIZE) {

			REDRAW_WIDGETS();

			self->w = COLS - 1;
			wresize(self->win,1,self->w);

			self->y = LINES - 1;

			goto render;
		}

		addch_textbar(self,self->curs_pos++,c);

		if (self->curs_pos >= (int)self->w) {
			self->start_pos++;
		}

render:
		if (c == KEY_RESIZE) {
			mvaddch(LINES-1,0,':' | COLOR_PAIR(DWHITE_DBLUE));
			refresh();
			touchwin(self->win);
		}

		curs_set((self->curs_pos >= (int)strlen(self->buffer)) ? 1 : 0);

		for (int i = self->start_pos; i < self->start_pos + self->w && self->buffer[i] != '\0'; i++) {

			if (i == self->curs_pos)
				waddch(self->win,self->buffer[i] | self->curs_color );
			else
				waddch(self->win,self->buffer[i]);

		}
		wrefresh(self->win);
	}

	curs_set(0);

	wbkgd(self->win,COLOR_PAIR(BLACK_BLACK));
	werase(self->win);

	wrefresh(self->win);
}

void 
free_textbar(Textbar *self)
{
	delwin(self->win);
	free(self);
}
