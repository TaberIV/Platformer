/// @description Creates player character
/// @param playerNum

var playerNum = argument0;

var player = instance_create_depth(obj_player_spawn.x + (22 * (playerNum - global.num_players / 2)), obj_player_spawn.y, -10, obj_player);
player.playerNum = playerNum;

return player;