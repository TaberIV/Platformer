/// @description Draw tutorial text

if (global.tutorial) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_tutorial);
	draw_set_color(c_white);
	
	switch (room) {
		case rm_level1:
			draw_text(room_width / 2, room_height / 3, "A to jump");
			break;
		case rm_level2:
			draw_text(room_width / 2, room_height / 3, "X or RT to sprint,\nHold A to jump further.");
			break;
		case rm_level3:
			draw_text(room_width / 8, room_height / 4, "Some levels have\nmultiple routes.");
			draw_text(room_width / 5, room_height * 0.9, "That is a power-up,\nbut getting it is tricky.")
			break;
	}
}