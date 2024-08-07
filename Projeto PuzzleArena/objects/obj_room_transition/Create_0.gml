image_yscale = room_height/sprite_height
image_xscale = room_width/sprite_width

x = 0
y = room_height/2

spd = 0.1

go_away = false

depth = -999

audio_stop_all()

audio_play_sound(sound_room_transition, 10, false)