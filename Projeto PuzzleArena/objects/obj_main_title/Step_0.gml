image_xscale = lerp(image_xscale, scale, 0.1)
image_yscale = lerp(image_yscale, scale, 0.1)

if (abs(scale - image_xscale) < 0.1) {
	if (!audio_is_playing(sound_main_menu_theme)) {
		audio_play_sound(sound_main_menu_theme, 10, true)
	}
	
	if (right) {
		image_angle = lerp(image_angle, -5, 0.15)
		
		if (abs(5 + image_angle < 0.1)) {
			right = false
		}
	} else {
		image_angle = lerp(image_angle, 5, 0.15)
		
		if (abs(5 - image_angle < 0.1)) {
			right = true
		}
	}
}