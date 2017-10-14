///@description Draws menu text
//Set color and center alignment
//Draws menu title
draw_set_color(c_white);
draw_set_valign(fa_center);
draw_set_halign(fa_center);

draw_set_font(fnt_menu_title);
draw_text(window_width / 2, window_height / 2 - space * scale, menu_title);

//Draw menu items
draw_set_font(fnt_menu_item);
for (var i = 0; i < num_items; i++) {
	draw_set_color((i == selection) ? c_yellow : c_white);
	draw_text(window_width / 2, window_height / 2 + space * scale * (i + .5), menu_items[i]);
}