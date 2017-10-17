/// @description Creates player character
/// @param playerNum

var playerNum = argument0;

var player = instance_create_depth(obj_player_spawn.x, obj_player_spawn.y, -10, obj_player);
player.playerNum = playerNum;

return player;