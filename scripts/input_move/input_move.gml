/// @description Gets input for movement

#region Gamepad stick
move_input[0] = sign(gamepad_axis_value(playerNum, gp_axislh));
move_input[1] = sign(gamepad_axis_value(playerNum, gp_axislv));
#endregion

#region If no stick input, then check dpad
if (move_input[0] = 0 and move_input[1] = 0) {
	if (gamepad_button_check(playerNum, gp_padl))
		move_input[0] -= 1;
	if (gamepad_button_check(playerNum, gp_padr))
		move_input[0] += 1;
	if (gamepad_button_check(playerNum, gp_padu))
		move_input[1] -= 1;
	if (gamepad_button_check(playerNum, gp_padd))
		move_input[1] += 1;
}
#endregion

#region If no gamepad input, then check keys

if (playerNum == global.keyboardPlayer and move_input[0] = 0 and move_input[1] = 0) {
	if (keyboard_check(vk_left) or keyboard_check(ord("A")))
		move_input[0] -= 1;
	if (keyboard_check(vk_right) or keyboard_check(ord("D")))
		move_input[0] += 1;
	if (keyboard_check(vk_up) or keyboard_check(ord("W")))
		move_input[1] -= 1;
	if (keyboard_check(vk_down) or keyboard_check(ord("S")))
		move_input[1] += 1;
}
#endregion

return move_input;