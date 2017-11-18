///@description Toggles full screen

window_set_fullscreen(!window_get_fullscreen());
menu_items[selection] = "Fullscreen: " + (window_get_fullscreen() ? "On" : "Off");