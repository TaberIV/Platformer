/// @description Set Main Menu layout

menu_set_layout(100, 100, c_white, fa_left, fa_top,
					48, 150, 200, c_white, c_yellow, fa_left, fa_center);

#region Find all levels
levels = ["Back"];
actions = [menu_back]
level = rm_level1;

for (var level = rm_level1; string_pos("level", room_get_name(level)) == 4; level++) {
	levels[(level - rm_level1) + 1] = "Level " + string((level - rm_level1) + 1);
	actions[(level - rm_level1) + 1] = game_goto_level_selection;
}

num_items = array_length_1d(levels);
levels[num_items] = "Slopes test";
actions[num_items] = game_goto_level_test;
#endregion

menu_set_contents("Level Select:", levels, actions);