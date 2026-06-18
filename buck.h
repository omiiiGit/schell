#ifndef BUCK_H
#define BUCK_H

#include <stdlib.h>

struct buck_t
{
	char name[28];
	bool is_extended,is_selected;

	struct buck_t *next;
	struct buck_t *prev;
};

struct buck_list_t
{
	struct buck_t *head;
	struct buck_t *tail;

	size_t size;
};



#endif
