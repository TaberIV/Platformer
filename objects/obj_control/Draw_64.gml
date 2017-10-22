///@description Draws debug messages

#region Draw view dividers
/*
if (play_room and !global.pause and global.num_players > 1) {
	draw_set_color(c_black);
	var line_width = 3;
	
	for (var player = 0; player < global.num_players; player++) {
		var x1 = (player % 2 == 0) ? -line_width : global.view_width;
		var y1 = (floor(player / 2) == 0) ? -line_width : global.view_height;
		var x2 = (player % 2 == 0) ? global.view_width : 2 * global.view_width + line_width;
		var y2 = (floor(player / 2) == 0) ? global.view_height : 2 * global.view_height + line_width;
		
		for (var i = 0; i < line_width; i++) {
			draw_rectangle(x1 + i, y1 + i, x2 - i, y2 - i, true);
		}
	}
}
*/
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