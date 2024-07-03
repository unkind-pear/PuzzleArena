if instance_exists(o_Player){
if player != noone{
	if player.lv < o_EnemySpawner.wave{
		draw_set_color(make_color_rgb(player.color_0, player.color_1, player.color_2))
		draw_text(room_width/2, room_height/2+180, "Selecione seu upgrade!")
			
		draw_sprite(S_Upgrades, upgrade1, room_width/2-60-16, room_height/2+120);
		draw_sprite(S_Upgrades, upgrade2, room_width/2-16, room_height/2+120);
		draw_sprite(S_Upgrades, upgrade3, room_width/2+60-16, room_height/2+120);
		
	}
}
}

draw_set_color(c_black)

if text1 == true{
	draw_text(room_width/2, room_height/2+200, UpgradePick(upgrade1, player, false))
}
if text2 == true{
	draw_text(room_width/2, room_height/2+200, UpgradePick(upgrade2, player, false))
}
if text3 == true{
	draw_text(room_width/2, room_height/2+200, UpgradePick(upgrade3, player, false))
}