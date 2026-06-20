#ifndef BUCK_H
#define BUCK_H

#include <stdlib.h>
#include <string.h>
#include <ncurses.h>

struct buck_t
{
	char name[128];
	bool is_extended,is_selected;

	struct buck_t *next;
	struct buck_t *prev;
};

struct buck_list_t
{
	struct buck_t *head;
	struct buck_t *tail;
	struct buck_t *selected;

	size_t size;
};

struct buck_list_t create_buck_list();
void push_buck_to_list(struct buck_list_t *list, char *name);
int free_buck_list(struct buck_list_t *list);
void go_next_buck(struct buck_list_t *list);
void go_prev_buck(struct buck_list_t *list);
void toggle_is_extended(struct buck_t *buck);


#endif
