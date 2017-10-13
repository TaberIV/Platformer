///@description Player movement

#region Process Movement
#region Horizontal momvement
//Caps run speed
if (sprintDown)
	var max_velocity_x = sprintSpeed;
else
	var max_velocity_x = runSpeed;

//Sets force to move player with
var moveForce = ((grounded) ? (walkForce) : (walkForce * airMobility));

//Set x velocity
velocity_[0] = clamp(velocity_[0] + moveForce * dir, -max_velocity_x, max_velocity_x);

//Friction
if (dir != sign(velocity_[0]) and grounded) {
	velocity_[0] = lerp(velocity_[0], 0, friction_);
	if (abs(velocity_[0]) < 1)
		velocity_[0] = 0;
}
#endregion

#region Vertical movement
player_apply_gravity();

//Jumping
mid_grounded = (tile_collision_inFloor(tile_collisions_map_id, x, bbox_bottom + 1) >= 0)
grounded = mid_grounded || (tile_collision_inFloor(tile_collisions_map_id, bbox_left, bbox_bottom + 1) >= 0)
						|| (tile_collision_inFloor(tile_collisions_map_id, bbox_right, bbox_bottom + 1) >= 0);


if (grounded && jumpPressed) {
	velocity_[1] = jumpSpeed;
	mid_grounded = false;
	
	audio_play_sound(snd_jump, 1, false);
}
#endregion

#region Wall riding
wallRide = false;
if (!grounded) {
	#region Checks if on wall
	var on_left_wall = tile_collision_check_all_points(tile_collisions_map_id, 
				[bbox_left - 1, bbox_bottom], 
				[bbox_left - 1, bbox_bottom - 32]);
	var on_right_wall = tile_collision_check_all_points(tile_collisions_map_id, 
				[bbox_right + 1, bbox_bottom], 
				[bbox_right + 1, bbox_bottom - 32]);
	//Disables wall jumping just above the ground
	var high = !tile_collision_check_points(tile_collisions_map_id, 
				[bbox_left, bbox_bottom + TILE_SIZE], [bbox_right, bbox_bottom + TILE_SIZE]);
	#endregion
	
	#region Sticks player to wall
	if ((on_left_wall or on_right_wall) and high) {
		wallRide = true;
		
		//Sets velocity
		velocity_[0] = 0;
		velocity_[1] = clamp(velocity_[1], -(TILE_SIZE - 1), ((move_input[1] <= 0) ? wallRideSpeed : wallRideSpeed * 2));
		
		//Sets draw info
		draw_dir = (on_right_wall) ? -1 : 1;
		
		#region Wall jump and unstick
		if (jumpPressed) {
			velocity_[0] = max_velocity_x * draw_dir;
			velocity_[1] = jumpSpeed;
			unstickCounter = unstickTime;
			audio_play_sound(snd_jump, 1, false);
		}
		else if (dir == draw_dir) {
			unstickCounter--;
			if (unstickCounter <= 0) {
				velocity_[0] = draw_dir * walkSpeed;
				wallRide = false;
				unstickCounter = unstickTime;
			}
		}
		else
			unstickCounter = unstickTime;
		#endregion
	}
	#endregion
}
#endregion
#endregion

#region Collisions
if (tile_collision_check_hazards(tile_hazard_map_id))
	player_kill();

if (place_meeting(x, y, obj_flag) and !instance_exists(obj_coin)) {
	control = false;
	if (alarm[0] == -1)
		alarm[0] = 20;
} else if (!control) {
	velocity_[0] = 0;
	velocity_[1] = clamp(velocity_[1], 0, TILE_SIZE);
}
#endregion

#region Move player
//Reapply floats
velocity_[0] += velocity_floats[0];
velocity_[1] += velocity_floats[1];

//Floor speed and keep remaining float separate
velocity_floats[0] = velocity_[0] - (floor(abs(velocity_[0]) * sign(velocity_[0])));
velocity_floats[1] = velocity_[1] - (floor(abs(velocity_[1]) * sign(velocity_[1])));
velocity_[0] -= velocity_floats[0];
velocity_[1] -= velocity_floats[1];

tile_collision_move(tile_collisions_map_id, velocity_);
#endregion