///@description Player movement

#region Process Movement
#region Horizontal momvement
//Caps run speed
if (sprintDown)
	var max_velocityx = sprintSpeed;
else
	var max_velocityx = runSpeed;

//Sets force to move player with
var moveForce = ((grounded) ? (walkForce) : (walkForce * airMobility));

//Set x velocity
velocity[0] = clamp(velocity[0] + moveForce * dir, -max_velocityx, max_velocityx);

//Friction
if (dir != sign(velocity[0]) and grounded) {
	velocity[0] = lerp(velocity[0], 0, friction_);
	if (abs(velocity[0]) < 1)
		velocity[0] = 0;
}
#endregion

#region Vertical movement
player_apply_gravity();

//Jumping
mid_grounded = (tile_collision_inFloor(tile_collisions_map_id, x, bbox_bottom + 1) >= 0)
grounded = (mid_grounded || tile_collision_check_points(tile_collisions_map_id, 
														[bbox_left, bbox_bottom + 1],
														[bbox_right, bbox_bottom + 1])) && velocity[1] >= 0;

doubleJumpCharge |= grounded and doubleJump;
if (grounded && jumpPressed) {
	velocity[1] = jumpSpeed;
	audio_play_sound(snd_jump, 1, false);
} else if (jumpPressed and doubleJumpCharge and velocity[1] > doubleJumpSpeed and !wallRide) {
	doubleJumpCharge = false;
	
	velocity[0] = (move_input[0] * 0.5 + (velocity[0] / max_velocityx) * 0.5) * max_velocityx;
	velocity[1] = doubleJumpSpeed;
	fallGrav = false;
	audio_play_sound(snd_jump, 1, false);
}

if (velocity[1] < 0)
	mid_grounded = false;
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
		velocity[0] = 0;
		velocity[1] = clamp(velocity[1], -(TILE_SIZE - 1), ((move_input[1] <= 0) ? wallRideSpeed : wallRideSpeed * 2));
		
		//Sets draw info
		draw_dir = (on_right_wall) ? -1 : 1;
		
		#region Wall jump and unstick
		if (jumpPressed) {
			velocity[0] = max_velocityx * draw_dir;
			velocity[1] = jumpSpeed;
			unstickCounter = unstickTime;
			audio_play_sound(snd_jump, 1, false);
		}
		else if (dir == draw_dir) {
			unstickCounter--;
			if (unstickCounter <= 0) {
				velocity[0] = draw_dir * walkSpeed;
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
if (bbox_right <= 0 or bbox_left >= room_width or bbox_top >= room_height or 
	tile_collision_check_touching(tile_hazard_map_id))
	player_kill();

if (place_meeting(x, y, obj_flag) and (!instance_exists(obj_coin) or obj_coin.collected[playerNum])) {
	if (global.winner == -1)
		global.winner = playerNum;
	control = false;
	
	if (alarm[0] == -1)
		alarm[0] = 20;
} else if (!control)
	velocity = [0, max(0, velocity[1])];
#endregion

#region Move player
//Reapply floats
velocity[0] += velocityfloats[0];
velocity[1] += velocityfloats[1];

//Floor speed and keep remaining float separate
velocityfloats[0] = velocity[0] - (floor(abs(velocity[0]) * sign(velocity[0])));
velocityfloats[1] = velocity[1] - (floor(abs(velocity[1]) * sign(velocity[1])));
velocity[0] -= velocityfloats[0];
velocity[1] -= velocityfloats[1];

tile_collision_move(tile_collisions_map_id, velocity);
#endregion