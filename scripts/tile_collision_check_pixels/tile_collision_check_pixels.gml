///@param tile_map_id
///@param point_arrays...
var tile_map_id = argument[0];

//Loop through points and check for tile
for (var i = 1; i < argument_count; i++) {
	var point = argument[i];
	var tile_index = tilemap_get_at_pixel(tile_map_id, point[0], point[1])

	// Check if in full tile
	if (tile_index == 1)
		return true;
	// Check if inside partial tile
	else if (tile_index > 1 and tile_collision_inFloor(tile_map_id, point[0], point[1]) > 0) {
		return true;
	}
}

return false;