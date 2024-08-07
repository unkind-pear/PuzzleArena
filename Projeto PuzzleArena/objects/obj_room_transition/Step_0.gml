if (!go_away) {
	x = lerp(x, room_width, spd)
	
	if (x - room_width < 0.1 and x - room_width > -0.1) {
		room_goto_next()
		go_away = true
		
		audio_play_sound(sound_room_transition, 10, false)
	}
}
else {
	x = lerp(x, room_width*2, spd)
	
	if (x >= (room_width*2 - 0.1)) {
		instance_destroy()
		audio_play_sound(sound_forest_theme, 10, true)
	}
}

