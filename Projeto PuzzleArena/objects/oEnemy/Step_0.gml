if (target == noone or !instance_exists(target)) {
	if (instance_exists(o_Player) and type == "Attack-Player") {
		var _p = instance_nearest(x, y, o_Player)
		
		if (point_distance(x, y, _p.x, _p.y) < (room_width^2 + room_height^2)^0.5) {
			target = _p
			target_x = target.x
			target_y = target.y
		}
		else {
			sprite_index = sprite_idle
			state = "stop"
		}
	}
	//else if (instance_exists(oPuzzle) and type == "Attack-Puzzle") { // Quando terminar o puzzle
		//target = instance_nearest(x, y, oPuzle)
		//target_x = target.x
		//target_y = target.y
	//}
	else if (state != "spawning") {
		sprite_index = sprite_idle
		state = "stop"
	}
}
else {
	target_x = target.x
	target_y = target.y
	direction_to_target = point_direction(x, y, target_x, target_y)
	if (state == "stop") {
		state = "chase"
	}
}

if place_meeting(x, y, o_DamageEnemy) {
	audio_play_sound(Hit_damage_1, 10, false)
	
	var _damage_list = ds_list_create(); // Cria para todos os danos atualmente no inimigo
	instance_place_list(x, y, o_DamageEnemy, _damage_list, false); // Coloca o dano atual na lista
	var _damage_list_size = ds_list_size( _damage_list );
	
	for ( var _i = 0; _i < _damage_list_size; _i++){ //Percorre todos os danos
			var _inst = ds_list_find_value( _damage_list, _i); //Pega cada dano singularmente
			
			if ds_list_find_index(damage_list_old, _inst) == -1{ //Vê se o dano desse objeto ja foi dado
			
				ds_list_add(damage_list_old, _inst) //Coloca que o dano ja foi tado
			
				hp -= _inst.damage;
			
				_inst.bullet_pierce--

			}		
	}
	
	ds_list_destroy( _damage_list )
}

var _damage_list_old_size = ds_list_size(damage_list_old);
	
for(var _i = 0; _i < _damage_list_old_size; _i++){ //Caso a instancia de dano nao esteja mais no inimigo, remove da lista
	var _inst = ds_list_find_value(damage_list_old, _i);
	if !instance_exists(_inst) || !place_meeting(x, y, _inst){
		ds_list_delete(damage_list_old, _i);
		_i--;
		_damage_list_old_size--;
	}
}

if ds_list_size(damage_list_old) > 0{ // Para cada x frames a lista reiniciar, podendo assim algumas armas tipo o fogo dar dano mais de uma vez no inimigo
	if list_reseter <= 0 {ds_list_clear(damage_list_old); list_reseter = list_reseter_dalay} else {list_reseter--}
} else {list_reseter = list_reseter_dalay}