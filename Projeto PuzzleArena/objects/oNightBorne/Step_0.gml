event_inherited()

if (hp > 0) {
	if (range_attack_delay_ended and state != "charge_attack" and state != "stop") {
		state = "charge"
	}

	// Código de estado
	switch state {
		case "chase": // Código de perseguição
			if (animationFinished() or sprite_index == sprite_idle) {
				sprite_index = sprite_walk
			}
	
			if (!targetInRange()) {
				var _instance_in_my_way = noone//collision_line(x, y, target.x, target.y, oWall, false, true)
			
				if (_instance_in_my_way == noone) { // Vá até player
				    x += lengthdir_x(velocity, direction_to_target)
				    y += lengthdir_y(velocity, direction_to_target)
				}
			}
			else {
				sprite_index = sprite_melee_attack
				target_was_in_range = true
				state = "attack"
			}
	
			flipSprite(direction_to_target, -scale)
		
			break
		
		case "attack": // Código de ataque	
			if (sprite_index == sprite_melee_attack and animationOnFrame(10)) {
			    doDamage(collision_rectangle(x + 35*image_xscale, y + 20*image_yscale, x - 10*image_xscale, y - 40*image_yscale, o_Player, false, true), melee_damage)
			}
	
			if (!melee_attack_delay_ended) { // Espere em sprite idle
				if (targetInRange() and animationFinished()) {
					sprite_index = sprite_idle
				}
			}
			else {
				if (target_was_in_range) { // Faça Melee Attack
					melee_attack_delay_ended = false
			
					image_index = 0
					sprite_index = sprite_melee_attack
				
					waitFor(melee_attack_delay_time, 0) //Delay
				}
			}
		
			if (animationFinished() and !targetInRange()) {
				sprite_index = sprite_walk
			
				state = "chase"
			}
		
			flipSprite(direction_to_target, -scale)
		
			break
		
		case "charge":
			sprite_index = sprite_idle
			sprite_set_speed(sprite_index, 9, spritespeed_framespersecond);
	
			if (!created_charging_animation) {
				created_charging_animation = true
				createChargingAnimation()
			
				waitFor(charge_time, 2) // Delay
			}
		
			flipSprite(direction_to_target, -scale)
		
			if (finished_charging) {
				created_charging_animation = false
			
				finished_charging = false
				state = "charge_attack"
			}
		
			break
		
		case "charge_attack":	
			if (sprite_index == sprite_melee_attack) {
				if (animationOnFrame(10)) {
					doDamage(collision_rectangle(x + 35*image_xscale, y + 20*image_yscale, x - 10*image_xscale, y - 40*image_yscale, o_Player, false, true), melee_damage)
				}
			}
	
			if (instance_exists(current_trail)) {
				if (animationOnFrame(7)) {
					image_speed = 0;
				}
			
				trail_scale = previous_distance_to_player/sprite_get_width(current_trail.sprite_index)
				current_trail.image_xscale = lerp(current_trail.image_xscale, previous_distance_to_player/sprite_get_width(current_trail.sprite_index), lerp_of_range_attack)
			}
			else if (current_trail == noone) { //Não tem trail -> Não começou o ataque
				prev_x = x
				prev_y = y
			
				sprite_index = sprite_melee_attack
			
				previous_distance_to_player = point_distance(x, y, target_x, target_y)
				previous_direction_to_target = direction_to_target
			
				distance_x = prev_x + lengthdir_x(previous_distance_to_player, previous_direction_to_target)
				distance_y = prev_y + lengthdir_y(previous_distance_to_player, previous_direction_to_target)
			
				current_trail = createTrail(previous_direction_to_target)
			}
		
			if (position_meeting(distance_x, distance_y, self) and not_ran_before) {			
				waitFor(instakill_attack_delay, 3)
				not_ran_before = false
			
				current_trail.parent = noone //Limpa o parent para sumir
			}
		
			if (instakill_attack_delay_ended) {
				instakill_attack_delay_ended = false
				not_ran_before = true
				current_trail = noone
				
				image_speed = 1
				
				range_attack_delay_ended = false
				waitFor(range_attack_delay_time, 1)
				
				state = "chase"
			}
		
			x = lerp(x, distance_x, lerp_of_range_attack)
			y = lerp(y, distance_y, lerp_of_range_attack)
		
			flipSprite(direction_to_target, -scale)
		
			break
	}

	// Código para mudar de player
	var _player_too_close = collision_circle(x, y, 128, o_Player, false, true)
	if (_player_too_close != target and _player_too_close != noone and state == "chase") {
		target = _player_too_close
	}
}
else {
	if (animationFinished() and sprite_index == sprite_death) {
		instance_destroy()
	}
	else if (sprite_index != sprite_death) {
		sprite_index = sprite_death
	}
	else if (image_speed != 1) {image_speed = 1}
}