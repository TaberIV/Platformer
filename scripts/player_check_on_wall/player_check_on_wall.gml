/// @descripton Checks if player is on a wall, returns true or false. If true, sets state to wallRide

var on_left_wall = tile_collision_check_all_points(tile_collisions_map_id, 
			[bbox_left - 1, bbox_bottom], 
			[bbox_left - 1, bbox_bottom - 32]);
var on_right_wall = tile_collision_check_all_points(tile_collisions_map_id, 
			[bbox_right + 1, bbox_bottom], 
			[bbox_right + 1, bbox_bottom - 32]);
//Disables wall jumping just above the ground
var high = !tile_collision_check_points(tile_collisions_map_id, 
			[bbox_left, bbox_bottom + TILE_SIZE], [bbox_right, bbox_bottom + TILE_SIZE]);
			

if ((on_left_wall or on_right_wall) and high) {
	state = states.wallRide;
	image_xscale = (on_right_wall) ? -1 : 1;
	
	return true;
} else
	return false;