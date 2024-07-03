event_inherited()

if (hp > 0) {
	// Código de estado
	switch state {
		case "spawning":
			if image_alpha < 1 {
				image_alpha += 0.05
			}
			else {
				state = "stop"
			}
		
			break
	
		case "chase": // Código de perseguição
			sprite_index = sprite_walk
			var _instance_in_my_way = noone//collision_line(x, y, target.x, target.y, oWall, false, true)
		
			if (targetInRange(range_attack_range)) {
				state = "attack"
			}

			if (_instance_in_my_way == noone) { // Vá até player
			    x += lengthdir_x(velocity, direction_to_target)
				y += lengthdir_y(velocity, direction_to_target)
			}
	
			flipSprite(direction_to_target, -scale)
		
			break
		
		case "attack": // Código de ataque
			if (animationOnFrame(4) and sprite_index == sprite_melee_attack) {
				doDamage(collision_rectangle(x + 20*image_xscale, y + 9*image_yscale, x - 2.5*image_xscale, y - 9*image_yscale, o_Player, false, true), melee_damage)
			}
			else if (animationOnFrame(9) and sprite_index = sprite_range_attack) {
				doDamage(collision_rectangle(x + 40*image_xscale, y + 9*image_yscale, x - 2.5*image_xscale, y - 9*image_yscale, o_Player, false, true), melee_damage)
			}
	
			if (targetInRange(melee_attack_range) and melee_attack_delay_ended) { // Faça Melee Attack
				melee_attack_delay_ended = false
			
				image_index = 0
				sprite_index = sprite_melee_attack
			
				alarm[1] = 1*room_speed //Delay
			}
			else if (targetInRange(range_attack_range) and range_attack_delay_ended) { // Faça Range Attack
				range_attack_delay_ended = false
		
				image_index = 0
				sprite_index = sprite_range_attack
		
				alarm[0] = 1*room_speed //Delay 4
			}
			else if (animationFinished() and !targetInRange(range_attack_range)) {
				state = "chase"
			}
		
			flipSprite(direction_to_target, -scale)
		
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