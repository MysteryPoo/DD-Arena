/// @description Draw
var shadowWidth = 16 * (1/max(1, (mAltitude / 32)));
draw_ellipse_color(x - shadowWidth, y - 4, x + shadowWidth, y + 4, c_black, c_black, false);
draw_sprite_ext(sprite_index, image_index, x, y - 12 - mAltitude, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
var percent = mFuse / mMaxFuse * 100;
draw_healthbar(x - 32, y - 64, x + 32, y - 56, percent, c_gray, c_red, c_green, 0, true, true);
