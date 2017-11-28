/// @description creates camera that alternates between all players

var camera = instance_create_depth(obj_player_spawn.x, obj_player_spawn.y, -50, obj_camera);
with (camera) {
	port = 3;
	target = global.players[0];
	highlight = true;
	alarm[0] = hold_min + random(hold_range);
}

with (camera) {
	// Setup view
	view_set_visible(port, true);
	
	#region Sets view dimensions
	var width = global.view_width / 2;
	var height =  global.view_height / 2;
	var xx = global.view_width * (port % 2);
	var yy = global.view_height * floor(port / 2)
	
	view_set_wport(port, width * 2);
	view_set_hport(port, height * 2);
	view_set_xport(port, xx);
	view_set_yport(port, yy);
	#endregion
	
	//Camera creation
	camera = camera_create_view(target.x, target.y, width, height, 
								0, id, -1, -1, width / 2, height / 2);
	view_camera[port] = camera;
}

return camera;