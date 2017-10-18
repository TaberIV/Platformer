/// @description Move camera
//Lerps camera toward target
var lerp_val = .15;
var target_x = target.x;
var target_y = target.y;

x = lerp(x, target_x, lerp_val);
y = lerp(y, target_y, lerp_val);