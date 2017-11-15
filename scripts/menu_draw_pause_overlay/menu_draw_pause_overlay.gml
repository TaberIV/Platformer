//Draw overlay for pause

var overlay_scale = display_get_gui_width() / sprite_get_width(spr_pause);
draw_sprite_ext(spr_pause, -1, 0, 0, overlay_scale, overlay_scale, 0, c_white, 1)