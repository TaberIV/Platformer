///@description Handles player input

if (control) {
	// Get movement input
	input_move();
	dir = sign(move_input[0]);

	// Get buttons pressed
	input_player_buttons();
} else {
	input_player_zero();
	dir = sign(move_input[0]);
}