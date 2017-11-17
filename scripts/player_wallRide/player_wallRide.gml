/// @descsription Wall riding

fallGrav = false;
velocity[1] += grav;

//Sets velocity
velocity[0] = 0;
velocity[1] = clamp(velocity[1], -(TILE_SIZE - 1), ((move_input[1] <= 0) ? wallRideSpeed : wallRideSpeed * 2));
		
#region Wall jump and unstick
if (jumpPressed) {
	velocity[0] = (sprintDown ? sprintSpeed : runSpeed) * image_xscale;
	velocity[1] = jumpSpeed;
	
	unstickCounter = unstickTime;
	audio_play_sound(snd_jump, 1, false);
	
	state = states.normal;
}
else if (dir == image_xscale) {
	unstickCounter--;
	
	if (unstickCounter <= 0) {
		velocity[0] = image_xscale * walkSpeed;
		
		unstickCounter = unstickTime;
		
		state = states.normal;
	}
}
else
	unstickCounter = unstickTime;
#endregion

player_move();

#region Determine next state
if (state == states.wallRide and !player_check_on_wall()) {
	state = states.normal;
player_check_finish();
}
#endregion