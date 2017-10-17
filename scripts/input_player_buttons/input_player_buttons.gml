/// @description gets player inputs

#region Gamepad buttons
sprintDown = gamepad_button_check(playerNum, gp_shoulderrb);
sprintDown |= gamepad_button_check(playerNum, gp_face3);
jumpDown = gamepad_button_check(playerNum, gp_face1);
jumpPressed = gamepad_button_check_pressed(playerNum, gp_face1);
#endregion

#region Keys
if (playerNum == global.keyboardPlayer) {
	sprintDown |= keyboard_check(vk_shift);
	jumpDown |= keyboard_check(vk_space);
	jumpPressed |= keyboard_check_pressed(vk_space);
}
#endregion