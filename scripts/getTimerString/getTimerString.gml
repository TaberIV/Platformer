///@argument Thingy

var timerSeconds = argument0 / room_speed;
var timerMinutes = floor(timerSeconds / 60);
timerSeconds -= timerMinutes * 60;

var timerString = string(timerMinutes) + ":";

if (timerSeconds < 10)
	timerString += "0";
	
timerString += string(timerSeconds);

return timerString;