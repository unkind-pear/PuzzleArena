
if instance_exists(o_Player){
	
	can_run = true
	for (var _i = 0; instance_number(o_Player) > _i; _i++){
		var _player = instance_find(o_Player, _i)
		if _player.lv < o_EnemySpawner.wave{
			can_run = false;
		}
	}
	
	if instance_exists(o_Puzzle) and can_run == true{
		if wave+1 != array_length(WaveMaker){
		if WaveMaker[wave][1] == inimigos_max and !instance_exists(oEnemy){wave++; dalay_max = WaveMaker[wave][0]; dalay = dalay_max; inimigos = WaveMaker[wave][2]; inimigos_max = 0;}

		if dalay <= 0 and WaveMaker[wave][1] != inimigos_max and instance_number(oEnemy) <= WaveMaker[wave][1]*0.5{

		if o_Puzzle.Wave_Can_Pass == 1{
			inimigos_max++
		} else if o_Puzzle.Wave_Can_Pass == -1{
			dalay = -dalay_max*5;
			o_Puzzle.Wave_Can_Pass = 0;
		}

		rand_x = irandom_range(room_width*0.1, room_width*0.9);
		rand_y = irandom_range(room_height*0.1, room_height*0.9);

		var _soma = 0;
		var _inimigo = 0
		var _foi = true
		var _antes = 0

		for(var _i = 0; _i < array_length(inimigos); _i++){
			_soma = _soma + inimigos[_i][1];
		};
		var _randomizer = irandom(_soma)

		while _foi{
			if inimigos[_inimigo][1] + _antes >= _randomizer{
				_foi = false;
			} else {_antes = _antes + inimigos[_inimigo][1]; _inimigo++}
		}

		instance_create_layer(rand_x, rand_y, "Enemies", inimigos[_inimigo][0])

		dalay = dalay_max+dalay;
		} else {dalay--}
		} else
		
		
		
		{
			bonus_timer++
			
			if instance_number(oEnemy) < bonus_timer/10{

				rand_x = irandom_range(room_width*0.1, room_width*0.9);
				rand_y = irandom_range(room_height*0.1, room_height*0.9);

				var _soma = 0;
				var _inimigo = 0
				var _foi = true
				var _antes = 0

				for(var _i = 0; _i < array_length(inimigos); _i++){
					_soma = _soma + inimigos[_i][1];
				};
				var _randomizer = irandom(_soma)

				while _foi{
					if inimigos[_inimigo][1] + _antes >= _randomizer{
						_foi = false;
					} else {_antes = _antes + inimigos[_inimigo][1]; _inimigo++}
				}

				instance_create_layer(rand_x, rand_y, "Enemies", inimigos[_inimigo][0])
			}
		
	}
	}
}