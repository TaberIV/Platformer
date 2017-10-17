///@description Creates camera
play_room = instance_exists(obj_player_spawn);

//If room is a level, creates a camera to follow player
if (play_room) {
	instance_create_depth(obj_player_spawn.x, obj_player_spawn.y, -10, obj_player);
	instance_create_depth(obj_player_spawn.x, obj_player_spawn.y, -10, obj_camera);
}