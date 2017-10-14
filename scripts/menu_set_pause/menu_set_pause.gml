/// @description Sets Pause Menu layout

menu_set_layout(screen_hcenter, screen_height / 3, c_white, fa_center, fa_center,
		36, screen_hcenter, screen_vcenter, c_white, c_yellow, fa_center, fa_center);

menu_set_contents("Pause", ["Resume", "Main Menu", "Settings", "Quit Game"], 
							[game_unpause, menu_goto_main, menu_set_settings, game_quit]);