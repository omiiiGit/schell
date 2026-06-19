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

extern struct buck_list_t bucks;

void init_gui();
void run();

void free_gui();

#endif
