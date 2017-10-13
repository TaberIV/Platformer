///@param tile_map_id
var tile_map_id = argument0;

// If bottom inFloor of hazard
if (tile_collision_check_pixels(tile_map_id, [bbox_left, bbox_top], [bbox_right, bbox_top],
											[bbox_left, bbox_bottom], [bbox_right, bbox_bottom]))
	return true;