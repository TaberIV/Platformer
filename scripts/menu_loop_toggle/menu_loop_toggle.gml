///@description Toggles full screen

global.loop = !global.loop;
menu_items[selection] = "Level loop: " + (global.loop ? "On" : "Off");