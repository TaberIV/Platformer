/// @description Set type of menu
playerNum = 0;

// Sets scale and creates resources
menu_rescale();
menu_get_pause_overlay();

// For picking menu options
selection = 0;
menu_items = [];
menu_actions = [];

#region Sets menu type
// Common values
screen_width = global.view_width;
screen_height = global.view_height;
screen_hcenter = screen_width / 2;
screen_vcenter = screen_height / 2;

// Sets menu type based on room
if (room == rm_menu) {
	menu_set_main();
}
else {
	menu_set_pause();
}
#endregion