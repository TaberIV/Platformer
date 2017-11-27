///@description Control keys

// Creates menu object when paused
if (input_pause_pressed() and play_room and !instance_exists(obj_menu)) {
	global.pause = true;
	instance_deactivate_all(true);
	instance_create_depth(0, 0, 0, obj_menu);
}

if (play_room and !global.pause and global.winner != -1) {
	var allDone = true;
	for (var i = 0; i < global.num_players and allDone; i++)
		allDone = (global.players[i].state == obj_player.states.finished);
	if (allDone and alarm[1] == -1)
		alarm[1] = 30;
}

#region Debug
// Toggle debug
if (keyboard_check_pressed(vk_f1)) {
	global.debug = !global.debug;
	alarm[0] = 60;
	debug_text = (global.debug) ? ("Debug mode on") : ("Debug mode off");
}

// Set keyboard player
for (var i = 0; i < 4; i++) {
	if (keyboard_check_pressed(ord(string(i + 1))) and keyboard_check(vk_control))
		global.keyboardPlayer = i;
}

// Reset room
if (keyboard_check_pressed(ord("R")) or gamepad_button_check_pressed(0, gp_select))
	room_restart();
#endregion