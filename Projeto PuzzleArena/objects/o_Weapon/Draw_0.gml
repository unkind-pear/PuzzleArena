draw_sprite_ext(sprite_index, 0, x + lengthdir_x(weapon_distance_mod_lerp, image_angle), y + lengthdir_y(weapon_distance_mod_lerp, image_angle) + weapon_distance_y_mod_lerp, image_xscale, image_yscale, image_angle+weapon_angle_mod_lerp, image_blend, image_alpha)

if alt_cooldown_timer < alt_cooldown*0.4 and alt_cooldown_timer > 0 {
	var _size = 1+(alt_cooldown_timer/alt_cooldown)
	gpu_set_fog(true, c_white, 0, 1000)
	draw_sprite_ext(sprite_index, 0, x + lengthdir_x(weapon_distance_mod_lerp, image_angle), y + lengthdir_y(weapon_distance_mod_lerp, image_angle), max(image_xscale, image_xscale*_size), max(image_yscale, image_yscale*_size), image_angle+weapon_angle_mod_lerp, c_white, 1)
	gpu_set_fog(false, c_white,0,1000)
}