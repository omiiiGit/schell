#ifndef WIDGETS_H
#define WIDGETS_H

#define REDRAW_WIDGETS() \
do { \
	erase(); refresh(); move(0,0); \
	show_buck_list(bucks);\
	show_buck_list(dates);\
} while(0) 

extern const char *DIRPATH;

extern struct buck_list_t *bucks;
extern struct buck_list_t *dates;

extern struct GuiList *buck_list;
extern struct GuiList *date_list;

extern struct Textbar *textbar;
extern bool is_debug;
extern int ec;


#endif
