#include "gui.h"

int main(int argc,char *argv[])
{
	init_gui();

	push_buck_to_list(&bucks,"Hari");
	push_buck_to_list(&bucks,"Manik");
	push_buck_to_list(&bucks,"hakamanish");
	push_buck_to_list(&bucks,"vitasp");

	bucks.tail->next->is_selected = true;

	run();

	free_gui();

	return 0;
}
