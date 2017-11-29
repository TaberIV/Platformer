/// @description Rescale text

if (scale != scale = window_get_width() / global.view_width) {
	font_delete(fnt_tutorial);
	scale = window_get_width() / global.view_width;
	fnt_tutorial = font_add(global.font, fnt_tut_size * scale, false, false, 32, 128);
}