/// @description Sets sprite

if (view_current < global.num_players)
	sprite_index = (global.players[view_current].win_condition) ? spr_flag : spr_flag_down;	
else
	sprite_index = spr_flag;
draw_self();