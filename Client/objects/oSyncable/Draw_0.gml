/// @description Name
draw_text(x, y + 32, mPlayerCacheRef.mUsername);
var _percent = round(mHitPoints / mMaxHitPoints * 100);
draw_healthbar(x - 32, y - 64, x + 32, y - 56, _percent, c_gray, c_red, c_green, 0, true, true);

with (mAvatarCacheRef) {
	draw_sprite_ext(mAvatarSprite, mAvatarFrame, other.x - 32, other.y + 32, 0.1, 0.1, 0, c_white, 1);
}
