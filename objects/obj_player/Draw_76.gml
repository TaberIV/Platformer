///@description Set current sprite
if (!wallRide) {
	//Turns character
	draw_dir = (dir != 0) ? dir : draw_dir;
	
	if (grounded and velocity_[1] >= 0) {
		#region Sets run cycle based on speed
		if (abs(velocity_[0]) == 0)
			sprite_index = spr_idle;
		else if (abs(velocity_[0]) < runSpeed)
			sprite_index = spr_walk;
		else if (abs(velocity_[0]) < sprintSpeed)
			sprite_index = spr_run;
		else if (abs(velocity_[0]) == sprintSpeed)
			sprite_index = spr_sprint;
		#endregion
	}
	else {
		#region Sets sprite when in air
		image_index = (sprite_index == spr_jump) ? image_index : 1;
		sprite_index = spr_jump;
		
		if (velocity_[1] >= 0)
			image_index = 3;
		else if (floor(image_index) == 2)
			image_index = 2;
		#endregion
	}
} else
	sprite_index = spr_wall_ride;