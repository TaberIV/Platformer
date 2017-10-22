///@description Draws debug messages

#region Draw view dividers
if (play_room and !global.pause and global.num_players > 1) {
	draw_set_color(c_black);
	var line_width = 3;
	
	show_debug_message(global.split_screen)
	if (global.split_screen == QUADRANT or global.split_screen == VERTICAL) {
		for (var i = 0; i < line_width; i++)
			draw_line(window_get_width() / 2 + floor(i - line_width / 2), -1, window_get_width() / 2 + floor(i - line_width / 2), window_get_height());
	}
	if (global.split_screen == QUADRANT or global.split_screen == HORIZONTAL) {
		for (var i = 0; i < line_width; i++)
			draw_line(-1, window_get_height() / 2 + floor(i - line_width / 2), window_get_width(), window_get_height() / 2 + floor(i - line_width / 2));
	}
}
#endregion

#region Draw win text
if (play_room and global.winner != -1) {
	var str = "Player " + string(global.winner + 1) + " wins!";
	
	draw_set_font(fnt_win);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_color(global.draw_colors[global.winner]);
	
	draw_text(window_get_width() / 2, window_get_height() / 3, str);
}
#endregion

#region Draws debug text
if (alarm[0] > 0) {
	draw_set_color(c_white);
	draw_set_font(fnt_debug);
	draw_set_valign(fa_left);
	draw_set_halign(fa_top);
	
	draw_set_alpha(clamp(alarm[0] / 30, 0, 1));
	draw_text(5, 5, debug_text);
	draw_set_alpha(1);
}
#endregion