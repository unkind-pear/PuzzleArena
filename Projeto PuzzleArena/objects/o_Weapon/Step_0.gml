if object_exists(o_Player){			//Vê se players existem
	if player != noone{				//Vê se o player que esta seguindo existe
		 if !instance_exists(player){
			 player = noone
			 cooldown_timer = 0			
			 alt_cooldown_timer = 0
			 
			 instance_destroy(self);
			 
			 }
	}
	
	if instance_position(x, y, o_Player) and player == noone{	//É pegado por um player
		if instance_position(x, y, o_Player).shoot == true and instance_position(x, y, o_Player).armado = false and instance_position(x, y, o_Player).ghost = false{
			player = instance_position(x, y, o_Player)				//Player que foi pegado
			player.armado = true;
		}
	}
}

if player == noone{		//Enquanto não pego
	
	image_angle = 0;
	
	weapon_distance_y_mod_lerp = lerp(weapon_distance_y_mod_lerp, weapon_distance_y_mod, 0.1)

	if (weapon_distance_y_mod > 0 and weapon_distance_y_mod_lerp > weapon_distance_y_mod*0.7) or (weapon_distance_y_mod < 0 and weapon_distance_y_mod_lerp < weapon_distance_y_mod*0.7){
		weapon_distance_y_mod = -weapon_distance_y_mod;
	}
	
} else if !player.death {
	
weapon_distance_y_mod_lerp = 0

if weapon_type == "Gun"{
	weapon_angle_mod = max(cooldown_timer/cooldown, 0)*5*image_yscale
	}
	
if weapon_type == "Slash"{
	if weapon_angle_mod = 0{
		weapon_angle_mod = -90
	}
}
image_angle = player.aim_dir;
var Atirou = player.shoot;
var Alt_Atirou = player.alt_shoot;

x = player.x + lengthdir_x( offset_player, image_angle );
y = player.y + lengthdir_y( offset_player, image_angle );

image_yscale = 1;

if player.aim_dir > 90 and player.aim_dir < 270{image_yscale = -1} // gira a arma certo

#region //Tiro

x_offset = lengthdir_x( sprite_lenght + offset_player, image_angle);
y_offset = lengthdir_y( sprite_lenght + offset_player, image_angle);

if Atirou and cooldown_timer <= 0{
	
	if weapon_type == "Slash"{
		weapon_angle_mod = -weapon_angle_mod
	}
	
	if weapon_type == "Stab"{
		weapon_distance_mod = 10
	}
	
	cooldown_timer = cooldown*player.cooldownMod
	if cooldown_timer < 0.7{ExtraBullets = 2; cooldown_timer = 1}
	if cooldown_timer < 0.4{ExtraBullets = 3; cooldown_timer = 1}
	if cooldown_timer < 0.3{ExtraBullets = 4; cooldown_timer = 1}
	
	WeaponShoot(primary_shoot)
	
	ExtraBullets = 1
	
	player.weapon_dash_distance = weapon_dash_distance;
	player.weapon_dash_vel = weapon_dash_vel;
	
}

if Alt_Atirou and alt_cooldown_timer <= 0{
	
	if weapon_type == "Slash"{
		weapon_angle_mod = -weapon_angle_mod
	}
	
	if weapon_type == "Stab"{
		weapon_distance_mod = 50
	}
	
	alt_cooldown_timer = alt_cooldown*player.cooldownMod
	if alt_cooldown_timer < 0.7{ExtraBullets = 2; alt_cooldown_timer = 1}
	if alt_cooldown_timer < 0.4{ExtraBullets = 3; alt_cooldown_timer = 1}
	if alt_cooldown_timer < 0.3{EtraBullets = 4; alt_cooldown_timer = 1}
	
	WeaponShoot(secondary_shoot)
	
	ExtraBullets = 1
	
	player.weapon_dash_distance = alt_weapon_dash_distance;
	player.weapon_dash_vel = alt_weapon_dash_vel;
	
}

cooldown_timer--;
alt_cooldown_timer--;

#endregion

weapon_angle_mod_lerp = lerp(weapon_angle_mod_lerp, weapon_angle_mod, 0.2)
weapon_distance_mod_lerp = lerp(weapon_distance_mod_lerp, weapon_distance_mod, 0.5)

if weapon_distance_mod_lerp > weapon_distance_mod*0.8{
	weapon_distance_mod = 0;
}

}