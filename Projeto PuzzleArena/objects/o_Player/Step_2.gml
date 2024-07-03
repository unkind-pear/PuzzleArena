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
	};
	
}

if o_EnemySpawner.wave != lv{if revive = 1{ghost = false; hp = min(max_hp, hp+max_hp*0.1); revive = 0}} else {revive = 1}