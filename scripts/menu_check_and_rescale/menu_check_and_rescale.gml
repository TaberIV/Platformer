///@description Checks if menu is at proper scale, and if not, resets scale

var window_width = window_get_width();
var window_height = window_get_height();

if (scale != window_width / global.view_width) {
	menu_rescale();
}