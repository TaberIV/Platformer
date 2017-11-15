/// @description Draw view dividers

if (global.num_players > 1) {
	var gui_width = display_get_gui_width();
	var gui_height = display_get_gui_height();
	
	#region Divider lines
	draw_set_color(c_black);
	var line_width = 1.5 * scale;
	
	if (global.split_screen == QUADRANT or global.split_screen == VERTICAL) {
		for (var i = 0; i < line_width; i++)
			draw_line(gui_width / 2 + floor(i - line_width / 2), -1, gui_width / 2 + floor(i - line_width / 2), gui_height);
	}
	if (global.split_screen == QUADRANT or global.split_screen == HORIZONTAL) {
		for (var i = 0; i < line_width; i++)
			draw_line(-1, gui_height / 2 + floor(i - line_width / 2), gui_width, gui_height / 2 + floor(i - line_width / 2));
	}
	#endregion
	
	#region Window labels
	if ((global.split_screen == QUADRANT or global.split_screen == VERTICAL)) {
		for (var i = 0; i < global.num_players; i++) {
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			
			draw_set_color(global.draw_colors[i]);
			draw_set_font(obj_control.fnt_player_labels)
			
			draw_text(global.view_width * (i % 2) + 15, global.view_height * floor(i / 2) + 15, "P" + string(i + 1));
		}
	}
	#endregion
}