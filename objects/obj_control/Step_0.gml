///@description Control keys

// Creates menu object when paused
if (input_pause_pressed() and play_room and !instance_exists(obj_menu)) {
	global.pause = true;
	instance_deactivate_all(true);
	instance_create_depth(0, 0, 0, obj_menu);
}

#region Debug
//Toggle debug
if (keyboard_check_pressed(vk_f1)) {
	global.debug = !global.debug;
	alarm[0] = 60;
	debug_text = (global.debug) ? ("Debug mode on") : ("Debug mode off");
}

//Debug keys
if (global.debug) {
	//Reset room
	if (keyboard_check(ord("R")) or gamepad_button_check(0, gp_select))
		room_restart();
}
#endregion