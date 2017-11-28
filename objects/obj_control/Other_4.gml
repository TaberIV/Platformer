///@description Creates players and cameras
play_room = instance_exists(obj_player_spawn);
view_enabled = play_room;

//If room is a level, creates a camera to follow player
if (play_room) {
	instance_create_layer(0, 0, "WorldObjects", obj_tutorial);
	global.winner = -1;
	
	#region Sets split screen type
	if (room_width == global.view_width and room_height == global.view_height or global.num_players == 1)
		global.split_screen = NONE;
	else if (global.num_players == 2) {
		if (room_width / global.view_width < room_height / global.view_height)
			global.split_screen = VERTICAL;
		else
			global.split_screen = HORIZONTAL;
	}
	else
		global.split_screen = QUADRANT;
	#endregion
	
	#region Creates players and cameras
	global.players = [];
	global.players[global.num_players - 1] = 0;
	for (var i = 0; i < global.num_players; i++) {
		global.players[i] = player_create(i);
		
		if (room_width > global.view_width or room_height > global.view_height or i == 0 or instance_exists(obj_collectable))
			game_camera_create(i, global.players[i]);
	}
	
	if (global.num_players == 3 and global.split_screen == QUADRANT) {
		highlight_camera_create();
	}
	#endregion
}