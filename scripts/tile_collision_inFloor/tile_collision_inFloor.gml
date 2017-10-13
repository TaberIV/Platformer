/// @description Checks to see if position is below the floor height of a given tile, returns how deep in floor
/// @param tilemap
/// @param x
/// @param y

var tilemap = argument0;
var room_x = argument1;
var room_y = argument2;

var tile_index = tilemap_get_at_pixel(tilemap, room_x ,room_y);

if (tile_collision_check_points(tilemap, [room_x, room_y]))
	return (room_y mod TILE_SIZE);
else if (tile_index > 1 and tile_index < 100) {
	tile_index = tile_get_index(tile_index);
	
	var thefloor = global.heights[(room_x mod TILE_SIZE) + (tile_index * TILE_SIZE)];
	return ((room_y mod TILE_SIZE) - thefloor);
} else 
	return -(TILE_SIZE - (room_y mod TILE_SIZE));