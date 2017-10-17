///@description Draw self
draw_color = global.draw_colors[playerNum] * 0.75;

draw_sprite_ext(sprite_index, -1, x, y, draw_dir, image_yscale, 0, draw_color, 1);

#region Draws hitbox
if (global.debug) {
	draw_set_color(c_lime);
	draw_set_alpha(.5);
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
	draw_set_alpha(1);
	
	#region Draws collision points
	var points = [];
	points[0, 0] = bbox_left - 1; 
	points[0, 1] = bbox_top - 1;
	points[1, 0] = x;
	points[1, 1] = bbox_top - 1;
	points[2, 0] = bbox_right + 1;
	points[2, 1] = bbox_top - 1;
	points[3, 0] = bbox_left - 1;
	points[3, 1] = y;
	points[4, 0] = bbox_right + 1;
	points[4, 1] = y;
	points[5, 0] = bbox_left - 1;
	points[5, 1] = bbox_bottom + 1;
	points[6, 0] = x;
	points[6, 1] = bbox_bottom + 1;
	points[7, 0] = bbox_right + 1;
	points[7, 1] = bbox_bottom + 1;
	
	for (var i = 0; i < 8; i++) {
		draw_set_color((tile_collision_check_points(tile_collisions_map_id, [points[i, 0], points[i, 1]])) ? (c_yellow) : (c_red));
		draw_rectangle(points[i, 0] - 1, points[i, 1] - 1, points[i, 0] + 1, points[i, 1] + 1, false);
	}
	#endregion
}
#endregion