///@param tile_map_id
///@param velocity_array
var tile_map_id = argument0;
var velocity = argument1;

var on_slope = tilemap_get_at_pixel(tile_map_id, x, bbox_bottom) > 1;

//Move horizontally
x += clamp(velocity[0] * global.delta, -(TILE_SIZE - 1), TILE_SIZE - 1);

//Horizontal collisions
var bbox_side = (velocity[0] > 0) ? bbox_right : bbox_left;

var side_top = [bbox_side, bbox_top];
var side_bottom = (on_slope) ? [x, y] : [bbox_side, bbox_bottom];
var side_middle = [bbox_side, y];

if (tile_collision_check_points(tile_map_id, side_top, side_middle, side_bottom)) {
	x = bbox_side & ~(TILE_SIZE - 1);	// Snaps player's x to the grid
	if (velocity[0] > 0)				// Shifts player so side is at grid, not center
		x -= (bbox_right + 1) - x;
	else
		x += TILE_SIZE + x - bbox_left;

	velocity[@ 0] = 0;
}

//Move vertically
y += clamp(velocity[1] * global.delta, -(TILE_SIZE - 1), TILE_SIZE - 1);

//Vertical collisions
if (tilemap_get_at_pixel(tile_map_id, x, bbox_bottom - 1) <= 1) {
	var bbox_side = (velocity[1] > 0) ? bbox_bottom: bbox_top;

	var left_side = [bbox_left, bbox_side];
	var right_side = [bbox_right, bbox_side];
	var center_side = [x, bbox_side];

	if (tile_collision_check_points(tile_map_id, left_side, center_side, right_side)) {
		y = bbox_side & ~(TILE_SIZE - 1);	// Snaps player's y to the grid
		if (velocity[1] > 0)				// Shifts player so side is at grid, not center
			y -= (bbox_bottom + 1) - y;
		else
			y += TILE_SIZE + y - bbox_top;

		velocity[@ 1] = 0;
	}
}

// Move to top of slope
var floordist = tile_collision_inFloor(tile_collisions_map_id, x, bbox_bottom);

while (floordist >= 0) {
	y -= (floordist + 1);
	floordist = tile_collision_inFloor(tile_collisions_map_id, x, bbox_bottom);
	
	if (velocity[1] > 0 or abs(floordist) >= abs(velocity[1]))
		velocity[@ 1] = 0;
}

//Walk down slopes
if (mid_grounded and floordist > TILE_SIZE / -2) {
	y += abs(floordist) - 1;
	if ((bbox_bottom mod TILE_SIZE) == TILE_SIZE - 1) {
		if (tilemap_get_at_pixel(tile_map_id, x, bbox_bottom + 1) > 1) {
			y += abs(tile_collision_inFloor(tile_map_id, x, bbox_bottom + 1));
		}
	}
}