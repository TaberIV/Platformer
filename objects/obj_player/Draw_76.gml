///@description Set current sprite
if (!wallRide) {
	//Turns character
	draw_dir = (dir != 0) ? dir : draw_dir;
	
	if (grounded) {
		#region Sets run cycle based on speed
		if (abs(velocity[0]) == 0)
			sprite_index = spr_idle;
		else if (abs(velocity[0]) < runSpeed)
			sprite_index = spr_walk;
		else if (abs(velocity[0]) < sprintSpeed)
			sprite_index = spr_run;
		else if (abs(velocity[0]) == sprintSpeed)
			sprite_index = spr_sprint;
		#endregion
	}
	else {
		#region Sets sprite when in air
		image_index = (sprite_index == spr_jump) ? clamp(image_index, 1, 2) : 1;
		sprite_index = spr_jump;
		
		if (velocity[1] >= 0)
			image_index = 3;
		#endregion
	}
} else
	sprite_index = spr_wall_ride;