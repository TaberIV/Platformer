/// @description Stops player input from having any influence over character

if (!place_meeting(x, y, obj_flag)) {
	velocity[0] = lerp(velocity[0], 0, friction_ / 2);
	velocity[1] = velocity[1] > 0 ? velocity[1] : lerp(velocity[1], 0, friction_);
}