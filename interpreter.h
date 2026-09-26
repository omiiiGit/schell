#ifndef INTEPRETER_H
#define INTEPRETER_H 


#include <stddef.h>
#include <string.h>
#include <ncurses.h>
#include <sys/stat.h>
#include <unistd.h>
#include <ftw.h>
#include <errno.h>
#include "textbar.h"
#include "widgets.h"
#include "guilist.h"
#include "buffer.h"
#include "color.h"

typedef enum {
	INTE_ADD,
	INTE_DELETE,
	INTE_ADDDATE,
	INTE_DELDATE,
	INTE_QUIT,
	INTE_INVALID,
}INTECMD;

void parse_command(void);

#endif
