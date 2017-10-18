/// @description Draws menu text

menu_check_and_rescale()

//Draw overlay for pause
if (global.pause) {
	menu_draw_pause_overlay();
}

//Draws menu text
menu_draw();