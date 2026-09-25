#include "interpreter.h"

const char *DIRPATH = "./dir";

struct {
	char *command;
	char *buffer;
	char message[BUFFSIZE];
} static InteCommands[] = {
	[INTE_ADD] =  {"ADDBUCK",NULL},
	[INTE_DELETE] = {"DELBUCK",NULL},
	[INTE_ADDDATE] =  {"ADDDATE",NULL},
	[INTE_DELDATE] = {"DELDATE",NULL},
	[INTE_QUIT] = {"quit",NULL},
	[INTE_INVALID] = {NULL,NULL}
};

static void
make_intecmd_msg(INTECMD type,char *msg) 
{
	strcpy(InteCommands[type].message,msg);
}

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

static void
add_entry(char *name) 
{
	char *path;

	/*if (0) {
		make_intecmd_msg(INTE_ADD,"Buck exist already");
		return;
	} */

	asprintf(&path,"%s/%s",DIRPATH,name);
	mkdir(path,0755);
	free(path);

	make_intecmd_msg(INTE_ADD,"Buck added successfully");

}

static void 
del_entry(char *name) 
{
	char *path;

	asprintf(&path,"%s/%s",DIRPATH,name);
	rmdir(path);
	free(path);

	make_intecmd_msg(INTE_DELETE,"Buck deleted successfully");
}

static void
add_date_entry(char *name)
{
	char *path;
	FILE *file;
	char *buck_name = buck_list->arr[buck_list->selected_index];

	asprintf(&path,"%s/%s/%s",DIRPATH,buck_name,name);

	if ((file = fopen(path,"w")) == NULL ) {
		fprintf(stderr,"Failed to load file %s\n",strerror(errno));
	}

	free(path);
	fclose(file);
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
			add_entry(buffer);
			buck_list->change = true;
			buck_list->is_ele_added = true;
			break;
	case INTE_DELETE:
			del_entry(buffer);
			buck_list->change = true;
			buck_list->is_ele_deleted = true;
			break;
	case INTE_ADDDATE:
			add_date_entry(buffer);
			date_list->is_ele_added = true;
			break;
	case INTE_DELDATE:
			break;
	case INTE_QUIT:
			ec = _CHAR_ESC;	
			make_intecmd_msg(INTE_QUIT,"Exiting..");
			break;
	case INTE_INVALID: 
			make_intecmd_msg(INTE_INVALID,"Invalid command");
			break;
	default:
	}

	attron(COLOR_PAIR(YELLOW_RED)); 

	mvprintw(LINES - 1,0,"%s",InteCommands[cmd_type].message); 

	attroff(COLOR_PAIR(YELLOW_RED));

	refresh();
	napms(600);
	move(LINES-1,0);
	clrtoeol();

}













