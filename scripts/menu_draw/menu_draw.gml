///@description Draws menu text

//Draws menu title
draw_set_color(menu_title_color);
draw_set_halign(menu_title_halign);
draw_set_valign(menu_title_valign);

draw_set_font(fnt_menu_title);
draw_text(menu_title_x * scale, menu_title_y * scale, menu_title);

//Draw menu items
draw_set_halign(menu_items_halign);
draw_set_valign(menu_items_valign);

draw_set_font(fnt_menu_item);
for (var i = 0; i < num_items; i++) {
	draw_set_color((i != selection) ? menu_items_color : menu_items_color2);
	draw_text(menu_items_x * scale, (menu_items_y + menu_items_space * i) * scale, menu_items[i]);
}