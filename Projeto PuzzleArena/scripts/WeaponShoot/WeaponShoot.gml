function WeaponShoot(bullet_list){
	if instance_exists(player){
	for (var _bullet_types = 0; _bullet_types < array_length(bullet_list); _bullet_types++){
		
		var _bullet_damage = bullet_list[_bullet_types].bullet_damage*player.damageMod
		var _bullet_sprite = bullet_list[_bullet_types].bullet_sprite
		var _bullet_pierce = bullet_list[_bullet_types].bullet_pierce + player.pierceMod
		var _bullet_bounce = bullet_list[_bullet_types].bullet_bounce + player.bounceMod
		var _bullet_life_time = bullet_list[_bullet_types].bullet_life_time
		if _bullet_life_time != "animation"{_bullet_life_time = _bullet_life_time*player.lifeMod}
		var _bullet_travel_speed = bullet_list[_bullet_types].bullet_travel_speed
		if _bullet_travel_speed != "locked" {_bullet_travel_speed = _bullet_travel_speed*player.travelMod}
		var _bullet_number = (bullet_list[_bullet_types].bullet_number + player.bulletMod)*ExtraBullets
		var _bullet_spread = bullet_list[_bullet_types].bullet_spread*player.spreadMod + player.bulletMod*15
		var _random_speed = bullet_list[_bullet_types].random_speed*player.randomMod
		var _random_spread = bullet_list[_bullet_types].random_spread*player.randomMod
	
		var _spread_div = _bullet_spread/max( _bullet_number-1, 1)
	
		for (var _bullet = 0; _bullet < _bullet_number; _bullet++){
			var _bullet_inst = instance_create_depth(player.x + x_offset, player.y + y_offset, depth-100, o_Bullet);
				
			_bullet_inst.player = player
			_bullet_inst.gun = self
			_bullet_inst.damage = _bullet_damage
			
			var _sprite = _bullet_sprite[irandom_range(0, array_length(_bullet_sprite)-1)]
			_bullet_inst.sprite_index = _sprite
			
			_bullet_inst.bullet_bounce = _bullet_bounce
			_bullet_inst.bullet_pierce = _bullet_pierce
			_bullet_inst.bullet_life_time = _bullet_life_time
			
			if _bullet_travel_speed != "locked"{
			var _randomize_speed = random_range(_bullet_travel_speed*(1-_random_speed), _bullet_travel_speed*(1+_random_speed));
			_bullet_inst.bullet_travel_speed = _randomize_speed
			} else {_bullet_inst.bullet_travel_speed = "locked"}
		
			_bullet_inst.image_angle = (image_angle - (_bullet_spread)/2 +_spread_div*_bullet) + random(_random_spread);
				
			}
	}
	}
}