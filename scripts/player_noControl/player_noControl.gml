/// @description Stops player input from having any influence over character

if (!place_meeting(x, y, obj_flag))
	velocity = [0, max(0, velocity[1])];