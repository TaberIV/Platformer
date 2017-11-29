/// @description Draw background gradient

if (view_current == 0) {
	var surf = application_surface;
	surface_set_target(surf);
	
	var surf_width = surface_get_width(surf);
	var surf_height = surface_get_height(surf);
	
	var color1 = make_color_rgb(9, 117, 161);
	var color2 = make_color_rgb(19, 201, 255);
	switch (global.split_screen) {
		case NONE:
		case VERTICAL:
			draw_rectangle_color(0, 0, surf_width, surf_height, color1, color1, color2, color2, false);
			break;
		case HORIZONTAL:
		case QUADRANT:
			draw_rectangle_color(0, 0, surf_width, surf_height / 2, color1, color1, color2, color2, false);
			draw_rectangle_color(0, surf_height / 2, surf_width, surf_height, color1, color1, color2, color2, false);
			break;
	}
	
	surface_reset_target();
}