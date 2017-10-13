/// @description Activates menu selections

//Pause button picks first option
if (pause_pressed) {
	selection = 0;
	select_pressed = true;		
} else {
	if (move_input_pressed[1] != 0)
		audio_play_sound(snd_menu_move, 1, false);
		
	selection = wrap(selection + move_input_pressed[1], 0, num_items - 1);
}

if (select_pressed) {
	script_execute(menu_actions[selection]);
}