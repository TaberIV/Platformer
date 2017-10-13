///@description Creates camera
play_room = instance_exists(obj_player);

//If room is a level, creates a camera to follow player
if (play_room)
	instance_create_depth(obj_player.x, obj_player.y, -10, obj_camera);