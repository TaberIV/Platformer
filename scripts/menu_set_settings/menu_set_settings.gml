/// @description Set Settings Menu layout

menu_set_layout(100, 100, c_white, fa_left, fa_top,
					48, 150, 200, c_white, c_yellow, fa_left, fa_center);

var fullString = "Fullscreen: " + (window_get_fullscreen() ? "On" : "Off");
var loopString = "Level loop: " + (global.loop ? "On" : "Off");
var tutString = "Tutorial: " + (global.tutorial ? "On" : "Off");
menu_set_contents("Settings:", ["Back", fullString, loopString, tutString], 
	[menu_back, menu_fullscreen_toggle, menu_loop_toggle, menu_tutorial_toggle]);