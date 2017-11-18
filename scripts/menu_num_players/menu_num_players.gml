/// @description Sets the number of players

global.num_players = wrap(global.num_players + 1, 1, 4);
menu_items[selection] = "Players: " + string(global.num_players);