/// @description Checks if player has finished the level

var collected_coins = !instance_exists(obj_coin) or obj_coin.collected[playerNum];
if (place_meeting(x, y, obj_flag) and collected_coins) {
	if (global.winner == -1)
		global.winner = playerNum;
	state = states.noControl;
}