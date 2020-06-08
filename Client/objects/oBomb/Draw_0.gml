/// @description Draw
var shadowWidth = 16 * (1/max(1, (mAltitude / 16)));
draw_set_alpha(0.5);
draw_ellipse_color(x - shadowWidth, y - 4, x + shadowWidth, y + 4, c_black, c_black, false);
if (mFuse < mMaxFuse * 0.33) {
	draw_circle_color(x, y, 64, c_red, c_red, false);
}
draw_set_alpha(1);
draw_sprite_ext(sprite_index, image_index, x, y - 6 - mAltitude, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

