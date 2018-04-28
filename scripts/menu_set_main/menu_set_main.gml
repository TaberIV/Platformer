/// @description Set Main Menu layout

menu_set_layout(100, 100, c_white, fa_left, fa_top,
					36, 150, screen_vcenter, c_white, c_yellow, fa_left, fa_center);

menu_set_contents("%#(!~? - (Working Title)", ["Play Game", "Players: " + string(global.num_players), "Level Select", "Settings", "Quit Game"],
								[game_start, menu_num_players, menu_set_lvlSelect, menu_set_settings, game_quit]);