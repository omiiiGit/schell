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
		.size = 0
	};
}

void push_buck_to_list(struct buck_list_t *list,char *name)
{
	struct buck_t *buck = create_buck_t(name);

	if(list->size == 0)
	{
		list->head = buck;
		list->tail = buck;
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



