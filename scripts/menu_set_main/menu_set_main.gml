/// @description Set Main Menu layout

menu_set_layout(100, 100, c_white, fa_left, fa_top,
					36, 150, screen_vcenter, c_white, c_yellow, fa_left, fa_center);

menu_set_contents("Platformer", ["Start Game", "Settings", "Level Select", "Quit Game"],
					[game_start, menu_set_settings, menu_set_lvlSelect, game_quit]);