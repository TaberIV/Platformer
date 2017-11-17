/// @description Get input based on state

switch (state) {
	case states.finished:
		player_zero_input();
		break;
	default:
		player_get_input();
		player_check_death();
}