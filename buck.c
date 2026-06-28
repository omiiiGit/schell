#include "buck.h"

static struct buck_t
*create_buck_t(char *name)
{
	struct buck_t *buck = (struct buck_t*)malloc(sizeof *buck);

	buck->next = buck->prev = NULL;
	buck->is_extended = buck->is_selected = false;

	strcpy(buck->name,name);

	return buck;
}

struct buck_list_t
create_buck_list()
{
	return (struct buck_list_t)
	{
		.head = NULL,
		.tail = NULL,
		.selected = NULL,
		.start_buck = NULL,
		.size = 0,
		.pos = 0,
	};
}

void push_buck_to_list(struct buck_list_t *list,char *name)
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

int free_buck_list(struct buck_list_t *list)
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

void go_next_buck(struct buck_list_t *list)
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

	if(list->pos >= LINES - 2)
	{
		list->start_buck = list->selected->next;
		change = true;
	}


	list->selected = list->selected->next;
	list->selected->is_selected = true;
	list->pos = (change) ? 0 : list->pos + 1;
}

void go_prev_buck(struct buck_list_t *list)
{
	bool change = false;	

	list->selected->is_selected = false;
	list->selected->is_extended = false;

	if(list->selected->prev == NULL)
	{
		list->selected = list->head;
		list->selected->is_selected = true;

		struct buck_t *b = list->head;
		for(int i = 0;i < (list->size - LINES);i++)
		{
			b = b->prev;
		}
		list->start_buck = b;

		list->pos = (list->size - LINES);

		return;	
	}

	if(list->pos == 0)
	{
		struct buck_t *buck = NULL; int i = 0;
		for(buck = list->selected; i <= LINES - 2; i++)
		{
			if(buck->prev != NULL)
				buck = buck->prev;
		}
		list->start_buck = buck;

		change = true;
	}
	

	list->selected = list->selected->prev;
	list->selected->is_selected = true;
	list->pos = (change) ? LINES - 2 : list->pos - 1;
}

void toggle_is_extended(struct buck_t *buck)
{
	buck->is_extended = (buck->is_extended) ? false : true;
}

