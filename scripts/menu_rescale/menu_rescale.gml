///@description Rescales menu

//Scale
scale = display_get_gui_height() / global.view_height;
fnt_menu_title = font_add(global.font, 36 * scale, false, false, 32, 128);
fnt_menu_item = font_add(global.font, 28 * scale, false, false, 32, 128);