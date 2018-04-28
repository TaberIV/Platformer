/// @description Draw tutorial text

if (global.tutorial and view_current < global.num_players) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_tutorial);
	draw_set_color(c_white);
	
	
	switch (room) {
		case rm_level1:
			var Ax = 752;
			var Ay = 440;
			var Ar = 32;
			var Aline = 3;
			var color1 = make_color_rgb(69, 145, 26);
			var color2 = make_color_rgb(121, 191, 29);
			
			draw_set_color(color1);
			draw_circle(Ax, Ay, Ar, false);
			draw_set_color(color2);
			draw_circle(Ax, Ay, Ar - Aline, false);
			
			draw_set_font(fnt_tutorial);
			draw_set_color(color1);
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
			draw_text(Ax + 1, Ay - Ar / 2, "A");
			break;
		case rm_level2:
			draw_text(room_width / 2, room_height / 3, "X or RT to sprint,\nHold A to jump further.");
			break;
		case rm_level3:
			draw_text(room_width / 6, room_height / 4, "In levels with coins you\nneed at least one to finish.");
			draw_text(room_width / 5, room_height * 0.9, "This is a power-up,\nbut getting it is tricky.")
			break;
		case rm_level4:
			draw_text(864, 256, "Slow\nDown")
	}
}