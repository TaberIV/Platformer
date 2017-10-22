/// @description creates camera following a target
/// @param port
/// @param target

var port = argument0;
var target = argument1;

var camera = instance_create_depth(obj_player_spawn.x, obj_player_spawn.y, -50, obj_camera);
camera.port = port;
camera.target = target;

with (camera) {
	// Setup view
	view_set_visible(port, true);
	
	#region Sets view dimensions
	var width = global.view_width;;
	var height =  global.view_height;;
	var xx = global.view_width * (port % 2);
	var yy = global.view_height * floor(port / 2);
	
	if (global.num_players == 2) {
		// Horizontal split screen
		if (room_width / global.view_width > room_height / global.view_height) {
			split_screen = HORIZONTAL;
			
			width = global.view_width;
			height = global.view_height * 2;
			
			xx = global.view_width * (port % 2);
			yy = 0;
		}
		// Vertical split screen
		else {
			split_screen = VERTICAL;
			
			view_set_wport(port, global.view_width * 2);
			view_set_hport(port, global.view_height);
			
			xx = 0;
			yy = global.view_height * floor(port / 2)
		}
	} else
		split_screen = QUADRANT;
	
	view_set_wport(port, width);
	view_set_hport(port, height);
	view_set_xport(port, xx);
	view_set_yport(port, yy);
	#endregion
	
	//Camera creation
	camera = camera_create_view(target.x, target.y, global.view_width, global.view_height, 
								0, id, -1, -1, global.view_width / 2, global.view_height / 2);
	view_camera[port] = camera;
}

return camera;