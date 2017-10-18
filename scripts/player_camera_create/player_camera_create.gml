/// @description creates camera following particular player
/// @param port number of player to follow

var playerNum = argument0;

var camera = instance_create_depth(obj_player_spawn.x, obj_player_spawn.y, -50, obj_camera);
camera.playerNum = playerNum;
with (camera) {	
	// Setup view
	view_set_visible(playerNum, true);
	view_set_wport(playerNum, global.view_width);
	view_set_hport(playerNum, global.view_height);

	view_set_xport(playerNum, global.view_width * (playerNum % 2));
	view_set_yport(playerNum, global.view_height * floor(playerNum / 2))

	//Set target
	target = global.players[playerNum];

	//Camera creation
	camera = camera_create_view(target.x, target.y, global.view_width, global.view_height, 
								0, id, -1, -1, global.view_width / 2, global.view_height / 2);
	view_camera[playerNum] = camera;
}

return camera;