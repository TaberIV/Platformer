/// @description Move camera

//Lerps camera toward target
if (instance_exists(target)) {	
	var lerp_val = .25;
	var target_x = target.x;
	var target_y = target.y;
	
	if (offset_target != 0 and target = obj_player) {
		offset_target = abs(offset_target) * target.draw_dir;
		offset = lerp(offset, offset_target, 0.02)
		
		if (abs(offset - offset_target) < 1)
			offset = offset_target;
		
		
		var target_x = target.x + offset;
	}
	
	x = lerp(x, target_x, lerp_val);
	y = lerp(y, target_y, lerp_val);
}