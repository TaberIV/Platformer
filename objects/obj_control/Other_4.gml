///@description Creates players and cameras
play_room = instance_exists(obj_player_spawn);
view_enabled = play_room;

// Creates players and camera
if (play_room) {
	global.winner = -1;
	
	// No split screen
	if (room_width <= global.view_width and room_height <= global.view_height)
		global.split_screen = NONE;
	else if (global.num_players == 2) {
		if (room_width / global.view_width < room_height / global.view_height)
			global.split_screen = VERTICAL;
		else
			global.split_screen = HORIZONTAL;
	} else
		global.split_screen = QUADRANT;
	
	//Creates players
	global.players[global.num_players - 1] = 0;
	for (var i = 0; i < global.num_players; i++) {
		global.players[i] = player_create(i);
		
		// Note: if other character specific properties than coins arise, this is problematic
		if (room_width > global.view_width or room_height > global.view_height or instance_exists(obj_coin) or i == 0)
			game_camera_create(i, global.players[i]);
	}
}