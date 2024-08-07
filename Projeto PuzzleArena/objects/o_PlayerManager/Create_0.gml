Weapon_List = [o_Flame, o_Katana, o_Knife, o_Uzi]

function criarPlayer() {
	var _playnum = 1;		//Contagem de players
	var _playnumlist = [];	//Lista de players 
	var _playnumcorrido = 0;	//Flag
	
	var _existe = 0
	if instance_exists(o_Player){
		for (var _p = 0; _p < instance_number(o_Player); ++_p){
			var _keyboard_player = instance_find(o_Player , _p)
			if _keyboard_player.id_player != -1{ _existe = 1 };
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