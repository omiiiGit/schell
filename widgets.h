#ifndef WIDGETS_H
#define WIDGETS_H

#define REDRAW_WIDGETS() \
do { \
	erase(); refresh(); move(0,0); \
	show_buck_list(bucks);\
	if(is_debug)\
		print_screen_info();\
} while(0) 

extern struct buck_list_t *bucks;
extern struct Textbar *textbar;
extern bool is_debug;



#endif
