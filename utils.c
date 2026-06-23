#include "utils.h"

int 
mystrcat(char *buffer,...)
{
	int n;
	char *s;
	va_list list;
	va_start(list,buffer);

	n = 0;

	while((s = va_arg(list,char*)) != NULL)
	{
		strcat(buffer,s);
		++n;
	}

	va_end(list);

	return n;	
}
