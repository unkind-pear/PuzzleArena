var _player_list = []

if instance_exists(o_Player){

for (var _i = 0; instance_number(o_Player) > _i; _i++){
	var _player = instance_find(o_Player, _i)
	array_push(_player_list, _player)
}

text1 = false; text2 = false; text3 = false

if instance_exists(o_Player){
	
	player = _player_list[player_num]

if player.lv < o_EnemySpawner.wave{
	if collision_rectangle(room_width/2-60-16+8, room_height/2+120, room_width/2-60+16-8, room_height/2+120+32, player, false, true){
		if player.interact == true{
			UpgradePick(upgrade1, player, true)
		
			player.lv++
		
			upgrade1 = irandom(array_length(upgrade_list)-1)
			upgrade2 = irandom(array_length(upgrade_list)-1)
			upgrade3 = irandom(array_length(upgrade_list)-1)
		}
		
		text1 = true;
	} else {text1 = false;}
	
	if collision_rectangle(room_width/2-16+8, room_height/2+120, room_width/2+16-8, room_height/2+120+32, player, false, true){
		if player.interact == true{
			UpgradePick(upgrade2, player, true)
		
			player.lv++
		
			upgrade1 = irandom(array_length(upgrade_list)-1)
			upgrade2 = irandom(array_length(upgrade_list)-1)
			upgrade3 = irandom(array_length(upgrade_list)-1)
		}
		
		text2 = true;
	} else {text2 = false;}
	if collision_rectangle(room_width/2+60-16+8, room_height/2+120, room_width/2+60+16-8, room_height/2+120+32, player, false, true){
		if player.interact == true{
			UpgradePick(upgrade3, player, true)
		
			player.lv++
		
			upgrade1 = irandom(array_length(upgrade_list)-1)
			upgrade2 = irandom(array_length(upgrade_list)-1)
			upgrade3 = irandom(array_length(upgrade_list)-1)
		}
		
		text3 = true;
	} else {text3 = false;}
} else {player_num++;}

if player_num >= array_length(_player_list) {player_num = 0}
}

}