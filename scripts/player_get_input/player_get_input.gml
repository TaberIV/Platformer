/// @description Gets player input

// Get movement input
input_move();
dir = sign(move_input[0]);

// Get buttons pressed
input_player_buttons();