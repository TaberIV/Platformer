///@description Toggles full screen

global.tutorial = !global.tutorial;
menu_items[selection] = "Tutorial: " + (global.tutorial ? "On" : "Off");