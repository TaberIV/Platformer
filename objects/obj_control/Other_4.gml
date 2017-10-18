///@description Creates players and cameras
play_room = instance_exists(obj_player_spawn);
view_enabled = play_room;
show_debug_message(play_room)

//If room is a level, creates a camera to follow player
if (play_room) {
	global.winner = -1;
	
	//Creates players
	global.players[global.num_players - 1] = 0;
	for (var i = 0; i < global.num_players; i++) {
		global.players[i] = player_create(i)
		player_camera_create(i);
	}
}