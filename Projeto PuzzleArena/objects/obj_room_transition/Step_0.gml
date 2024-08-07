if (!go_away) {
	x = lerp(x, room_width, spd)
	
	if (x - room_width < 0.1 and x - room_width > -0.1) {
		room_goto(room_to_go)
		go_away = true
		
		audio_play_sound(sound_room_transition, 10, false)
	}
}
else {
	x = lerp(x, room_width*2, spd)
	
	if (x >= (room_width*2 - 10)) {
		if (instance_exists(o_PlayerManager)) {
			audio_play_sound(sound_forest_theme, 10, true)
			instance_create_layer(room_width/2, room_height/2, "Players", obj_room_name)		
		}
		
		instance_destroy()
	}
}

