#ifndef COLOR_H 
#define COLOR_H 


#define CREATE_COLORS_FOR(color) \
	X(BLACK,color)\
	X(RED,color)\
	X(GREEN,color)\
	X(YELLOW,color)\
	X(BLUE,color)\
	X(MAGENTA,color)\
	X(CYAN,color)\
	X(WHITE,color)


#define X(first,second) \
	first##_##second,
typedef enum
{
	CREATE_COLORS_FOR(BLACK)
	CREATE_COLORS_FOR(RED)
	CREATE_COLORS_FOR(GREEN)
	CREATE_COLORS_FOR(YELLOW)
	CREATE_COLORS_FOR(BLUE)
	CREATE_COLORS_FOR(MAGENTA)
	CREATE_COLORS_FOR(CYAN)
	CREATE_COLORS_FOR(WHITE)
}GUI_COLOR;
#undef X

#endif
