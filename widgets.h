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
extern bool is_shell_executed;
extern bool is_debug;
extern int ec;
extern Textbar *textbar;


//void draw_widgets(void);


#endif
