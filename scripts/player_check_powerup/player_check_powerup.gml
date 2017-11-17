/// @description Checks for powerups and collects them

if (place_meeting(x, y, obj_powerup) and doubleJump == false) {
	doubleJump = true;
	doubleJumpCharge = true;
}