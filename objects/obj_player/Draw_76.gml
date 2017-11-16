///@description Set current sprite
switch (state) {
	case states.noControl:
	case states.normal:
		//Turns character
		image_xscale = (dir != 0) ? dir : image_xscale;
	
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
			if (!doubleJumpSprite) {
				image_index = (sprite_index == spr_jump) ? clamp(image_index, 1, 2) : 1;
				sprite_index = spr_jump;
		
				if (velocity[1] >= 0)
					image_index = 3;
			} else {
				image_index = (sprite_index == spr_jump || sprite_index == spr_jump_roll) ? 
								clamp(image_index, 1, 8) : 1;
				
				if (image_index == 8) {
					sprite_index = spr_jump
					image_index = 3;
					doubleJumpSprite = false;
				}
				else
					sprite_index = spr_jump_roll;
			}
			#endregion
		}
		break;

	case states.wallRide:
		sprite_index = spr_wall_ride;
		break;
}
	