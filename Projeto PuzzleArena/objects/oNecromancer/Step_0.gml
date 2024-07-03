event_inherited()

if (hp > 0) {
	// Código de estado
	switch state {
		case "chase": // Código de nada (ficar parado)
			sprite_index = sprite_idle
	
			if (targetInRange()) {
				state = "attack"
			}
			else if (animationFinished() and portal_attack_delay_ended) {
				state = "attack"
			}
	
			flipSprite(direction_to_target, -scale)
		
			break
		
		case "attack": // Código de ataque
			if (targetInRange() and melee_attack_delay_ended) { // Faça Melee Attack
				melee_attack_delay_ended = false
			
				image_index = 0
				sprite_index = sprite_range_attack
			
				waitFor(delay_between_magic_ball_attacks, 1) //Delay
			}
			else if (portal_attack_delay_ended) { // Faça Range Attack
				portal_attack_delay_ended = false
		
				image_index = 0
				sprite_index = sprite_melee_attack
			}
			else if (targetInRange()) { // RUN
				var _x_direction = lengthdir_x(-velocity, direction_to_target)
				var _y_direction = lengthdir_y(-velocity, direction_to_target)
				
				var _x_exited_screen = false
				var _y_exited_screen = false
				
				if (x + 60 > room_width or x- 60 < 0) {
					var _quadrant = whatQuadrantIsItIn(direction_to_target)
					_x_exited_screen = true
					
					switch _quadrant {
						case 1:
							_x_direction = lengthdir_y(velocity, 270)
							break
						case 2:
							_x_direction = lengthdir_y(velocity, 270)
							break
						case 3:
							_x_direction = lengthdir_y(velocity, 90)
							break
						case 4:
							_x_direction = lengthdir_y(velocity, 90)
							break
					}
				}
				else if (y + 60 > room_height or y - 60 < 0) {
					var _quadrant = whatQuadrantIsItIn(direction_to_target)
					_y_exited_screen = true
					
					switch _quadrant {
						case 1:
							_y_direction = lengthdir_y(velocity, 180)
							break
						case 2:
							_y_direction = lengthdir_y(velocity, 0)
							break
						case 3:
							_y_direction = lengthdir_y(velocity, 0)
							break
						case 4:
							_y_direction = lengthdir_y(velocity, 180)
							break
					}
					
					if (_x_exited_screen and _y_exited_screen) {
						_x_direction = 0
						_y_direction = 0
					}
				}

				x += _x_direction
				y += _y_direction
				
				x = min(x, room_width - 64) // sexo adicionado
				x = max(0,x)
				y = max(0, y)
				y = min(y, room_height - 64)
			}
		
			if (animationFinished()) {
				if (sprite_index == sprite_range_attack) {createSpell(direction_to_target)} //else {createAreaSpell(direction_to_target)}
				else {
					while true {
						var _random_point_x = random_range(x-portal_spawn_range, x+portal_spawn_range)	
						var _random_point_y = random_range(y-portal_spawn_range, y+portal_spawn_range)
						
						var _portal_created_successfully = true
				
						if (!point_in_circle(_random_point_x, _random_point_y, x, y, 65)) {
							_portal_created_successfully = createPortal(_random_point_x, _random_point_y)
							
							if (_portal_created_successfully) {
								break
							}
						}
					}
				
				
					waitFor(portal_attack_delay, 0) //Delay 4
				}
			
				sprite_index = sprite_walk
			
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