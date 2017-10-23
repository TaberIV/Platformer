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
	var width;
	var height;
	var xx;
	var yy;
	
	switch (global.split_screen) {
		case NONE:
		case QUADRANT:
			width = global.view_width;
			height =  global.view_height;
			xx = global.view_width * (port % 2);
			yy = global.view_height * floor(port / 2);
			break;
		case VERTICAL:
			width = global.view_width;
			height = global.view_height * 2;
			
			xx = global.view_width * (port % 2);
			yy = 0;
			break;
		case HORIZONTAL:
			
			width = global.view_width * 2;
			height = global.view_height;
			
			xx = 0;
			yy = global.view_height * (port % 2);
			break;
	}
	
	view_set_wport(port, width);
	view_set_hport(port, height);
	view_set_xport(port, xx);
	view_set_yport(port, yy);
	#endregion
	
	//Camera creation
	camera = camera_create_view(target.x, target.y, width, height, 
								0, id, -1, -1, width / 2, height / 2);
	view_camera[port] = camera;
}

return camera;