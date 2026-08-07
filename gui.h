#ifndef GUI_H
#define GUI_H 

#include <stdio.h>
#include <ncurses.h>
#include <stdbool.h>
#include <locale.h>
#include "color.h"
#include "buck.h"
#include "controls.h"
#include "buffer.h"

extern struct buck_list_t bucks;
extern struct buck_list_t ab;
extern bool is_shell_executed;
extern bool is_debug;
extern int ec;

void init_gui();
void run();

void free_gui();

#endif
