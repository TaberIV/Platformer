/// @description Set type of menu

// Sets scale and creates resources
menu_rescale();
menu_get_pause_overlay();

//For picking menu options
selection = 0;
menu_items = [];
menu_actions = [];

//Sets menu type
if (room == rm_menu) {
	pause = false;
	
	//Position information
	space = 36;
	
	//Menu strings and functions
	menu_title = "Platformer";
	menu_items = ["Start Game", "Quit Game"];
	menu_actions = [game_start, game_quit];
}
else {
	pause = true;
	
	//Position information
	space = 36;
	title_x = global.view_width / 2;
	title_y = global.view_width / 4;
	
	//Menu strings and functions
	menu_title = "Pause";
	menu_items = ["Resume", "Main Menu", "Quit Game"];
	menu_actions = [game_unpause, menu_goto_main, game_quit];
}

num_items = array_length_1d(menu_items);