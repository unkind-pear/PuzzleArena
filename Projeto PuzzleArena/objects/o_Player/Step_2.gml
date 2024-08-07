centro_y = y + centro_y_offset
ControllerVibration(id_player, controller_vibration_left, controller_vibration_right);

if controller_vibration_time > 0 { //Timer para parar de vibrar o controle
	
controller_vibration_time--;

} else{
	
controller_vibration_left = 0;
controller_vibration_right = 0;

};

if death{
	
	animation_locked = 1;
	spd_mod = 0;
	sprite_index = s_PlayerDeath;
	ControllerVibration(id_player, 0, 0);
	if (image_index > image_number - 1) {
	ghost = true; death = false; animation_locked = 0;
	var ghost_id = instance_create_layer(x, y, "Players", o_Ghost)
	ghost_id.id_player = id_player;
	ghost_id.color_0 = color_0;
	ghost_id.color_1 = color_1;
	ghost_id.color_2 = color_2;
	ghost_id.num_player = num_player;
	ghost_id.spd = spd;
	ghost_id.spd_mod = spd_mod;
	x = -1150; y = -1510
	};
	
}

if o_EnemySpawner.wave != lv{if revive = 1{ghost = false; hp = min(max_hp, hp+max_hp*0.1); revive = 0; x = room_width/2; y = room_height/2}} else {revive = 1}