/// @description Draw tileset
draw_sprite(spr_collision, -1, 0, 0);

for (var row = 0; row < tile_rows; row++) {
	for (var check_x = 0; check_x < tile_columns * TILE_SIZE; check_x++) {
		for(var check_y = 0; check_y <= TILE_SIZE; check_y++) {			
			global.heights[check_x + (row * tile_columns * TILE_SIZE)] = check_y;
			
			if (check_y == TILE_SIZE) break;
			if (surface_getpixel(application_surface, check_x, check_y + row * TILE_SIZE) != c_black) break;
		}
	}
}

room_goto_next();