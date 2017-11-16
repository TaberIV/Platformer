/// @description Get input based on state

switch (state) {
	case states.noControl:
		player_zero_input();
		break;
	default:
		player_get_input();
}