/// @description Set player menu layout

menu_set_layout(100, 100, c_white, fa_left, fa_top,
					48, 150, 200, c_white, c_yellow, fa_left, fa_center);

menu_set_contents("Number of Players:", ["1", "2", "3", "4"], 
	[menu_num_players, menu_num_players, menu_num_players, menu_num_players]);