#ifndef GUILIST_H
#define GUILIST_H

#define _XOPEN_SOURCE_EXTENDED 1
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ncurses.h>
#include "color.h"

typedef struct GuiList{
	WINDOW *win;
	char *name;

	int h,w,y,x;

	char **arr;
	size_t pos;
	size_t tsize;

	int selected_index;
	int start_index;
	int end_index;

	int e_pos;

	bool change;
	bool focus;
	bool hide;
	bool is_ele_added;
	bool is_ele_deleted;
	bool is_ele_pos_changed;
}GuiList;

void init_guilist(GuiList *arr,size_t size,int h,int w,int y,int x);
void push_opt_guilist(GuiList *self,char *s);
void updates_guilist(GuiList *self,int c);
void print_guilist(GuiList *self);
void empty_guilist(GuiList *self);
void free_guilist(GuiList *self);

#endif
