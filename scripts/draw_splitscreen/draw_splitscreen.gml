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
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(obj_control.fnt_player_labels);
	
	var text_offset = 8 * scale;
	
	if (global.split_screen != NONE) {
		for (var i = 0; i < global.num_players; i++) {
			if ((global.split_screen == QUADRANT or global.split_screen == VERTICAL)) {
				var text_x = (gui_width / 2) * (i % 2) + text_offset;
				var text_y = (gui_height / 2) * floor(i / 2) + text_offset;
			} else if (global.split_screen == HORIZONTAL) {
				var text_x = text_offset;
				var text_y = (gui_height / 2) * (i % 2) + text_offset;
			}
			
			draw_set_color(global.draw_colors[i]);
			draw_text(text_x, text_y, "P" + string(i + 1));
		}
	}
	#endregion
	
	#region Finished Text
	draw_set_font(obj_control.fnt_win);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	for (var i = 0; i < global.num_players; i++) {
		if (global.players[i].state == obj_player.states.finished) {
		
			switch (global.split_screen) {
				case NONE:
				case QUADRANT:
					var text_x = (gui_width / 4) + (gui_width / 2) * (i % 2);
					var text_y = (gui_height / 4) + (gui_height / 2) * floor(i / 2);
					break;
				case VERTICAL:
					var text_x = (gui_width / 4) + (gui_width / 2) * (i % 2);
					var text_y = (gui_height / 2);
					break;
				case HORIZONTAL:
					var text_x = (gui_width / 2);
					var text_y = (gui_height / 4) + (gui_height / 2) * (i % 2);
					break;
			}
			
			draw_set_color(global.draw_colors[i]);
			draw_text(text_x, text_y, "Finished");
		}
	}
	#endregion
}