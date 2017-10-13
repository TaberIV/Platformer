/// @description Draw tileset
var surf = surface_create(tile_columns * TILE_SIZE, tile_rows * TILE_SIZE);
var buff = buffer_create(0, buffer_fixed, 1);

// Draw tiles to surf
surface_set_target(surf);
draw_clear_alpha(0, 0);

for (var row = 0; row < tile_rows; row++) {
	for (var col = 0; col < tile_columns; col++) {
		draw_tile(tile_collisions, col + tile_columns * row, 0, row * TILE_SIZE, col * TILE_SIZE);
	}
}


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