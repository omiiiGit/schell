#ifndef BUCK_H
#define BUCK_H

#define _XOPEN_SOURCE_EXTENDED 1
#include <stdlib.h>
#include <string.h>
#include <ncurses.h>
#include "controls.h"
#include "buffer.h"
#include "color.h"

struct buck_t
{
	char name[128];
	bool is_extended,is_selected;

	struct buck_t *next;
	struct buck_t *prev;
	int index;
};

struct buck_list_t
{
	struct buck_t *head;
	struct buck_t *tail;
	struct buck_t *selected;
	struct buck_t *start_buck;

	WINDOW *win;
	const char *name;

	bool focus;
	bool hide;

	int lines;
	int pos;
	int e_pos;
	size_t size;

};

void create_buck_list(struct buck_list_t *self,int lines,int w,int y,int x,const char *name);
void push_buck_to_list(struct buck_list_t *list, char *name);
int free_buck_list(struct buck_list_t *list);
void event_buck_list(struct buck_list_t *self,int c);
void go_next_buck(struct buck_list_t *list);
void go_prev_buck(struct buck_list_t *list);
size_t show_buck_list(struct buck_list_t *list);


#endif
