/// @description Process movement when in normal state
#region Horizontal momvement

#region Inputted movement
// Conditions for x velocity
var max_velocityx = (sprintDown) ? sprintSpeed : runSpeed;
var moveForce = ((grounded) ? (walkForce) : (walkForce * airMobility));

velocity[0] = clamp(velocity[0] + moveForce * dir, -max_velocityx, max_velocityx);
#endregion

#region Friction
if (dir != sign(velocity[0]) and grounded) {
	velocity[0] = lerp(velocity[0], 0, friction_);
	
	if (abs(velocity[0]) < 1)
		velocity[0] = 0;
}
#endregion

#endregion

#region Vertical movement
#region Gravity
if (velocity[1] < 0 and !jumpDown)
	fallGrav = true;
else if (velocity[1] >= 0 or grounded)
	fallGrav = false;
velocity[1] += grav * (fallGrav ? 3 : 1);
#endregion

#region Jumping
mid_grounded = (tile_collision_inFloor(tile_collisions_map_id, x, bbox_bottom + 1) >= 0)
grounded = (mid_grounded || tile_collision_check_points(tile_collisions_map_id, 
														[bbox_left, bbox_bottom + 1],
														[bbox_right, bbox_bottom + 1])) && velocity[1] >= 0;

if (grounded && jumpPressed) {
	velocity[1] = jumpSpeed;
	audio_play_sound(snd_jump, 1, false);
}

#region Double Juump
doubleJumpCharge |= grounded and doubleJump;
if (!grounded and jumpPressed and doubleJumpCharge and velocity[1] > doubleJumpSpeed) {
	doubleJumpCharge = false;
	
	velocity[0] = (move_input[0] * 0.5 + (velocity[0] / max_velocityx) * 0.5) * max_velocityx;
	velocity[1] = doubleJumpSpeed;
	fallGrav = false;
	audio_play_sound(snd_jump, 1, false);
	doubleJumpSprite = true;
}
#endregion

if (velocity[1] < 0)
	mid_grounded = false;
#endregion
#endregion

player_move();

#region Determine next state
if (state == states.finished)
	state = states.finished;
else if (player_check_on_wall())
	state = states.wallRide;
#endregion