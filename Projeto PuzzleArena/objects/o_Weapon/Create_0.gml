b = global.bullet_list

weapon_type = "Gun"

cooldown = 10			//Cooldown
alt_cooldown = 200			//Cooldown Segundario

weapon_dash_distance = 0;
weapon_dash_vel = 0;
alt_weapon_dash_distance = 0;
alt_weapon_dash_vel = 0;

primary_shoot = [];
secondary_shoot = [];
//array_push(primary_shoot, b.uzi)
//array_push(secondary_shoot, b.alt_uzi)

offset_player = 25;			//Distancia entre o player e a arma

#region // Variveis Dinâmicas

sprite_lenght = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index); //Pega o tamanho da arma dde forma dinamica
x_offset = 0;	//offset de ond sai a bala
y_offset = 0;

player = noone;

cooldown_timer = 0;
alt_cooldown_timer = 0;
destroy = false;

weapon_angle_mod = 0;
weapon_angle_mod_lerp = 0;
weapon_distance_mod = 0;
weapon_distance_mod_lerp = 0;
weapon_distance_y_mod = 10;
weapon_distance_y_mod_lerp = 0;
ExtraBullets = 0;

#endregion