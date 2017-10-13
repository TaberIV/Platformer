/// @description Destroy resources

if (sprite_exists(spr_pause))
	sprite_delete(spr_pause);

font_delete(fnt_menu_title);
font_delete(fnt_menu_item);