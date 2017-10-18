/// @description Sets sprite

sprite_index = (!instance_exists(obj_coin) or obj_coin.collected[view_current]) ? spr_flag : spr_flag_down;	
draw_self();