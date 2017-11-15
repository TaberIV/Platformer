/// @description Draw view dividers

if (global.num_players > 1) {
	draw_set_color(c_black);
	var line_width = 3 * scale;
	
	if (global.split_screen == QUADRANT or global.split_screen == VERTICAL) {
		for (var i = 0; i < line_width; i++)
			draw_line(window_get_width() / 2 + floor(i - line_width / 2), -1, window_get_width() / 2 + floor(i - line_width / 2), window_get_height());
	}
	if (global.split_screen == QUADRANT or global.split_screen == HORIZONTAL) {
		for (var i = 0; i < line_width; i++)
			draw_line(-1, window_get_height() / 2 + floor(i - line_width / 2), window_get_width(), window_get_height() / 2 + floor(i - line_width / 2));
	}
}