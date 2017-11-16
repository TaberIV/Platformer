///@description Proccesses movement based on state

// Proccesses movement based on state
switch (state) {
	case states.noControl:
		player_noControl();
	case states.normal:
		player_normal();
		break;
	case states.wallRide:
		player_wallRide();
		break;
}

#region Collisions
if (bbox_right <= 0 or bbox_left >= room_width or bbox_top >= room_height or 
	tile_collision_check_touching(tile_hazard_map_id))
	player_kill();
#endregion