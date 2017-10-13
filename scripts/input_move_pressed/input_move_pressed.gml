///@description Gets move_input_pressed (does not include stick at this time)

move_input_pressed = [0, 0];

#region Dpad
if (gamepad_button_check_pressed(0, gp_padl))
	move_input_pressed[0] -= 1;
if (gamepad_button_check_pressed(0, gp_padr))
	move_input_pressed[0] += 1;
if (gamepad_button_check_pressed(0, gp_padu))
	move_input_pressed[1] -= 1;
if (gamepad_button_check_pressed(0, gp_padd))
	move_input_pressed[1] += 1;
#endregion

#region If no gamepad input, then check keys
if (move_input_pressed[0] = 0 and move_input_pressed[1] = 0) {
	if (keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A")))
		move_input_pressed[0] -= 1;
	if (keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D")))
		move_input_pressed[0] += 1;
	if (keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W")))
		move_input_pressed[1] -= 1;
	if (keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S")))
		move_input_pressed[1] += 1;
}
#endregion

return move_input_pressed;