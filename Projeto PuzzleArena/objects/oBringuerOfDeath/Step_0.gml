event_inherited()

if (hp > 0) {
	// Código de estado
	switch state {
		case "chase": // Código de perseguição
			sprite_index = sprite_walk
			var _instance_in_my_way = noone//collision_line(x, y, target.x, target.y, oWall, false, true)
		
			if (targetInRange()) {
				state = "attack"
			}
			else if (animationFinished() and range_attack_delay_ended) {
				state = "attack"
			}

			if (_instance_in_my_way == noone) { // Vá até player
			    x += lengthdir_x(velocity, direction_to_target)
			    y += lengthdir_y(velocity, direction_to_target)
			}
	
			flipSprite(direction_to_target, scale)
		
			break
		
		case "attack": // Código de ataque
			if (sprite_index == sprite_melee_attack and animationOnFrame(5)) {
				doDamage(collision_rectangle(x - 100*image_xscale, y + 32.5*image_yscale, x + 2.5*image_xscale, y - 40*image_yscale, o_Player, false, true), melee_damage)
			}
	
			if (targetInRange() and melee_attack_delay_ended) { // Faça Melee Attack
				melee_attack_delay_ended = false
			
				image_index = 0
				sprite_index = sprite_melee_attack
			
				alarm[1] = 1*room_speed //Delay
			}
			else if (range_attack_delay_ended) { // Faça Range Attack
				range_attack_delay_ended = false
		
				image_index = 0
				sprite_index = sprite_range_attack
		
				alarm[0] = 8*room_speed //Delay
			}
		
			if (animationFinished()) {
				if (sprite_index == sprite_range_attack) {createSpell()}
			
				sprite_index = sprite_walk
			
				state = "chase"
			}
		
			flipSprite(direction_to_target, scale)
		
			break
	}

	// Código para mudar de player
	var _player_too_close = collision_circle(x, y, 128, o_Player, false, true)
	if (_player_too_close != target and _player_too_close != noone) {
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
}