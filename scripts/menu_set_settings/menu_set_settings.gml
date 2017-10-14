/// @description Set Settings Menu layout

menu_set_layout(100, 100, c_white, fa_left, fa_top,
					48, 150, 200, c_white, c_yellow, fa_left, fa_center);
					
menu_set_contents("Settings:", ["Back", "Toggle Full Screen"], [menu_back, game_fullscreen_toggle]);