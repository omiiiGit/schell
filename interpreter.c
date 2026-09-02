#include "interpreter.h"

struct {
	char *command;
	char *buffer;
	char *message;
} static InteCommands[] = {
	[INTE_ADD] =  {"ADD",NULL,"Create buck successfully"},
	[INTE_DELETE] = {"DELETE",NULL,"Delete buck successfully"},
	[INTE_QUIT] = {"quit",NULL,"Exiting..."},
	[INTE_INVALID] = {NULL,NULL,"Invalid Command"}
};

static INTECMD 
get_cmd_type(char *cmd) 
{
	int cmdsize = sizeof(InteCommands)/sizeof(InteCommands[0]);
	char *c;

	for (int i = 0;i < cmdsize;i++) {
		c = InteCommands[i].command;

		if (c != NULL && strcmp(c,cmd) == 0)
			return i;
	}

	return INTE_INVALID;
}

void
parse_command(void)
{
	char *buffer,*cmd;
	INTECMD cmd_type;

	cmd = strtok(textbar->buffer," ");
	buffer = strtok(NULL," ");

	cmd_type = get_cmd_type(cmd);
	
	switch (cmd_type) {
	case INTE_ADD:
			//mvprintw(LINES - 1,0,"%s -> %s",cmd,buffer);
			push_buck_to_list(bucks,buffer);
			mvprintw(LINES - 1,0,"%s",InteCommands[cmd_type].message);
			break;
	case INTE_DELETE:
			break;
	case INTE_QUIT:

			break;
	case INTE_INVALID: 
			mvaddstr(LINES-1,0,"Invalid command");
			break;
	default:
	}

	refresh();
	napms(400);
	move(LINES-1,0);
	clrtoeol();

}
