#ifndef GUI_H
#define GUI_H 

#define _XOPEN_SOURCE_EXTENDED 1
#include <stdio.h>
#include <ncurses.h>
#include <stdbool.h>
#include <locale.h>
#include <outils.h>
#include "color.h"
#include "buck.h"
#include "buffer.h"


#define BLEN (strlen(BUFFER))
#define _KEY_ENTER 10
#define _KEY_ESC 27
#define _CHAR_COLON ':'
#define _CHAR_ESC 27

extern struct buck_list_t bucks;
extern bool is_shell_executed;
extern bool is_debug;
extern int ec;

void init_gui();
void run();

void free_gui();

#endif
