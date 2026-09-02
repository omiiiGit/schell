#ifndef INTEPRETER_H
#define INTEPRETER_H 

#include <stddef.h>
#include <string.h>
#include <ncurses.h>
#include "textbar.h"
#include "widgets.h"
#include "color.h"

typedef enum {
	INTE_ADD,
	INTE_DELETE,
	INTE_QUIT,
	INTE_INVALID,
}INTECMD;

void parse_command(void);

#endif
