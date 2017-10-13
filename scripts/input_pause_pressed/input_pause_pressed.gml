///@description returns whether button was pushed to pause the game

pause_pressed = gamepad_button_check_pressed(0, gp_start) || keyboard_check_pressed(vk_escape);

return pause_pressed;