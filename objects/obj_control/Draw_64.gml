///@description Draws debug messages

//Draw view dividers
if (play_room and global.num_players > 1) {
	draw_set_color(c_black);
	var line_width = 4;
	//Outline
	for (i = 0; i < line_width; i++) {
		draw_rectangle(i, i, window_get_width() - i, window_get_height() - i, true);
	}
	// Crosses
	draw_rectangle((window_get_width() - line_width) / 2, 0, (window_get_width() + line_width) / 2, window_get_height(), false)
	draw_rectangle(0, (window_get_height() - line_width) / 2, window_get_width(), (window_get_height() + line_width) / 2, false)
}

// Draw win text
if (play_room and global.winner != -1) {
	var str = "Player " + string(global.winner + 1) + " wins!";
	
	draw_set_font(fnt_win);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_color(global.draw_colors[global.winner]);
	
	draw_text(window_get_width() / 2, window_get_height() / 3, str);
}

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