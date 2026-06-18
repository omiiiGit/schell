#include "buck.h"

static struct buck_t
*create_buck_t(char *name)
{
	struct buck_t *buck = (struct buck_t*)malloc(sizeof *buck);

	buck->next = buck->prev = NULL;
	buck->is_extended = buck->is_selected = false;

	return buck;
}
