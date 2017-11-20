/// @description Checks if player has finished the level

if (win_condition) {
	if (global.winner == -1)
		global.winner = playerNum;
	state = states.finished;
}