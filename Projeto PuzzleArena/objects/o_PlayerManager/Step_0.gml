//Ve quantos controles tem
var _gp_num = gamepad_get_device_count();

var _playnum = 1;		//Contagem de players
var _playnumlist = [];	//Lista de players 
var _playnumcorrido = 0;	//Flag

for (var _players = 0; _players != _gp_num; _players++){	//Para cada controle ele fica detectando input
	var _existe_player = 0									//Flag para ver se aquele controle ja entrou no jogo
	if gamepad_button_check(_players, gp_start){			//Input Start para colocar o personagem
		if instance_exists(o_Player){						//Vendo se ja existe algum _player
			for (var _o = 0; _o < instance_number(o_Player); _o++;){ //Vendo todos os personagens para ver se esse controle ja tem um
				var _player = instance_find(o_Player ,_o);
				if _player.id_player == _players{
					_existe_player = 1
				};
				array_push(_playnumlist,_player.num_player);
			}
		}
		
		while !_playnumcorrido{
			_playnumcorrido = 1;
			for(var _h = 0; _h != array_length(_playnumlist); _h++){
				if _playnum == _playnumlist[_h]{_playnum++; _playnumcorrido = 0}
			}
		}
		
		if !_existe_player{	//Caso controle nao tenha jogador cria um
			var _rand_x = irandom_range(room_width*0.1, room_width*0.9);
			var _rand_y = irandom_range(room_height*0.1, room_height*0.9);
			
			while place_meeting(_rand_x, _rand_y, oEnemy){
				_rand_x = irandom_range(room_width*0.2, room_width*0.8);
				_rand_y = irandom_range(room_height*0.2, room_height*0.8);
			}

			var _player = instance_create_layer(_rand_x, _rand_y, "Players", o_Player);
				with (_player)
				{
					id_player = _players;
					num_player = _playnum;
				}
			var _weapon = irandom(array_length(Weapon_List)-1)
			instance_create_layer(_rand_x, _rand_y, "Players", Weapon_List[_weapon])
		}
		break;
	}
}

if keyboard_check_pressed(vk_space){ //Mesma coisa de cima só que para o teclado
	var _existe = 0
	if instance_exists(o_Player){
		for (var _p = 0; _p < instance_number(o_Player); ++_p){
			var _keyboard_player = instance_find(o_Player , _p)
			if _keyboard_player.id_player == -1{ _existe = 1 };
			array_push(_playnumlist,_keyboard_player.num_player);
		}
		while !_playnumcorrido{
			_playnumcorrido = 1;
			for(var _h = 0; _h != array_length(_playnumlist); _h++){
				if _playnum == _playnumlist[_h]{_playnum++; _playnumcorrido = 0}
			}
		}
	}
	if !_existe {
		var _rand_x = irandom_range(room_width*0.1, room_width*0.9);
		var _rand_y = irandom_range(room_height*0.1, room_height*0.9);

		while place_meeting(_rand_x, _rand_y, oEnemy){
			_rand_x = irandom_range(room_width*0.2, room_width*0.8);
			_rand_y = irandom_range(room_height*0.2, room_height*0.8);
		}

		var _player = instance_create_layer(_rand_x, _rand_y, "Players", o_Player);
			with (_player)
			{
				id_player = -1;
				num_player = _playnum;
			}
			var _weapon = irandom(array_length(Weapon_List)-1)
			instance_create_layer(_rand_x, _rand_y, "Players", Weapon_List[_weapon])
	}
}

var deaths = 0;
if instance_exists(o_Player){
	for (var _i = 0; instance_number(o_Player) > _i; _i++){
		var _player = instance_find(o_Player, _i)
		if _player.ghost == true {deaths++}
	}
	if instance_number(o_Player) = deaths{
		
		if o_Stats.Score < o_EnemySpawner.bonus_timer{
			o_Stats.Score = o_EnemySpawner.bonus_timer;
		}
		
		if o_Stats.Wave < o_EnemySpawner.wave{
			o_Stats.Wave = o_EnemySpawner.wave; 
		}
		
		room_goto(Start)}
}