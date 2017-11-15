/// @description Draws menu text

menu_check_and_rescale()

//Draw overlay for pause
if (global.pause) {
	menu_draw_pause_overlay();
	draw_splitscreen();
	
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
	draw_set_alpha(1);
}

//Draws menu text
menu_draw();