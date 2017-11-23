///@description Draws GUI

if (scale != window_get_width() / global.view_width) {
	scale = window_get_width() / global.view_width;
	font_delete(fnt_win);
	font_delete(fnt_player_labels);
	fnt_win = font_add(global.font, 36 * scale, false, false, 32, 128);
	fnt_player_labels = font_add(global.font, 24 * scale, false, false, 32, 128);
}

if (play_room and !global.pause)
	draw_splitscreen();

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