///@description Checks if menu is at proper scale, and if not, resets scale

if (scale != display_get_gui_height() / global.view_height) {
	menu_rescale();
}