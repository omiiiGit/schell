#ifndef GUI_H
#define GUI_H 

#include <stdbool.h>
#include <locale.h>
#include "textbar.h"
#include "color.h"
#include "buck.h"
#include "controls.h"
#include "buffer.h"
#include "widgets.h"
#include "interpreter.h"

void init_gui(void);
void run(void);
void print_screen_info(void);

void free_gui();

#endif
