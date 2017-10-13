///@description Rescales menu

//Scale
window_width = window_get_width();
window_height = window_get_height();

scale = window_width / global.view_width;
fnt_menu_title = font_add(global.font, 36 * scale, false, false, 32, 128);
fnt_menu_item = font_add(global.font, 28 * scale, false, false, 32, 128);