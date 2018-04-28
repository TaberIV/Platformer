draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_color(global.draw_colors[global.winner]);

draw_set_font(fnt_winner);

var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();

draw_text(gui_width / 2, gui_height / 2 - 75, "Player " + string(global.winner + 1) + " Wins!!");

draw_set_font(fnt_winnerTimer);
draw_set_color(c_white);
draw_text(gui_width / 2, gui_height / 2, getTimerString(global.playerTimers[global.winner]));