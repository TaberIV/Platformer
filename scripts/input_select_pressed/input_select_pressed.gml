///@description returns whether button was pushed to select menu item

select_pressed = gamepad_button_check_pressed(0, gp_face1) || keyboard_check_pressed(vk_space)
					|| (keyboard_check_pressed(vk_enter) and !keyboard_check(vk_alt));

return select_pressed;