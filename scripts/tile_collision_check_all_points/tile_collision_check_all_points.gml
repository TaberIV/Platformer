///@param tile_map_id
///@param point_arrays...
var tile_map_id = argument[0];

//Loop through points and check for tile
for (var i = 1; i < argument_count; i++) {
	var point = argument[i];
	if (tilemap_get_at_pixel(tile_map_id, point[0], point[1]) != 1)
		return false;
}

return true;