///@description Resets all player values and places them at beggining of level

if (bbox_right <= 0 or bbox_left >= room_width or bbox_top >= room_height or 
	tile_collision_check_touching(tile_hazard_map_id)) {
	audio_play_sound(snd_die, 1, false);

	// Reset values
	x = xstart;
	y = ystart;
	velocity = [0, 0];
	image_xscale = 1;
	state = states.normal;
	
	#region Reset collectables
	var num_collectables = instance_number(obj_collectable);
	for (var i = 0; i < num_collectables; i++) {
		var collectable = instance_find(obj_collectable, i);
		if (collectable != noone)
			collectable.collected[playerNum] = false;
	}
	
	#region Reset abilities
	doubleJump = false;
	doubleJumpCharge = false;
	doubleJumpSprite = false;
	#endregion
	#endregion
}