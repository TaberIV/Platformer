///@description Kills player and makes new instance at start of level

if (bbox_right <= 0 or bbox_left >= room_width or bbox_top >= room_height or 
	tile_collision_check_touching(tile_hazard_map_id)) {
	audio_play_sound(snd_die, 1, false);

	// Reset values
	x = xstart;
	y = ystart;
	velocity = [0, 0];
	image_xscale = 1;
	state = states.normal;

	doubleJump = false;
	doubleJumpCharge = false;
	doubleJumpSprite = false;
}