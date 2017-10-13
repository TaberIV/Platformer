/// @description Draw tileset
var surf = surface_create(tile_columns * TILE_SIZE, tile_rows * TILE_SIZE);
var buff = buffer_create(tile_num * sqr(TILE_SIZE) * 4, buffer_fixed, 1);

// Draw tiles to surf
surface_set_target(surf);
draw_clear_alpha(0, 0);

for (var row = 0; row < tile_rows; row++) {
	for (var col = 0; col < tile_columns; col++) {
		draw_tile(tile_collisions, col + tile_columns * row, 0, col * TILE_SIZE, row * TILE_SIZE);
	}
}
surface_reset_target();


// Get heights from buffer
buffer_get_surface(buff, surf, 0, 0, 0);

for (var row = 0; row < tile_rows; row++) {
	for (var check_x = 0; check_x < tile_columns * TILE_SIZE; check_x++) {
		var count = 0;
		for(var check_y = 0; check_y <= TILE_SIZE; check_y++) {
			var pixel = buffer_peek(buff, (check_x + (check_y * tile_columns * TILE_SIZE) + (row * tile_columns * sqr(TILE_SIZE))) * 4, buffer_u32)
			
			if ((pixel & 0xff000000) != 0)
				break;
				
			count++;
		}
		
		global.heights[check_x + (row * tile_columns * TILE_SIZE)] = count;
	}
}

room_goto_next();