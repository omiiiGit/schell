#ifndef TEXTBAR_H
#define TEXTBAR_H

#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <string.h>
#include <ncurses.h>
#include "buck.h"
#include "buffer.h"
#include "color.h"

typedef struct Textbar {
	unsigned int x,y,w,h;
	int curs_pos;
	int start_pos;

	char buffer[BUFFSIZE];

	WINDOW *win;

	chtype bar_color;
	chtype curs_color;
} Textbar;

Textbar *create_textbar(WINDOW *parent,int w,int x,int y,chtype bar_color,chtype curs_color);
void draw_textbar(Textbar *self);
void free_textbar(Textbar *self);


void print_screen_info(void);
size_t show_buck_list(struct buck_list_t *list);



#endif
