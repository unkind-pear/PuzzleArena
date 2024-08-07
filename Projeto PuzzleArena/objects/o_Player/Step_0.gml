
image_xscale = size
image_yscale = size

if !death{

if id_player > -1 {

#region	//Caso for um controle
gamepad_set_axis_deadzone(id_player, 0.15);		//Deadzone da bolinha do controle
gamepad_set_button_threshold(id_player, 0.10);	//Deadzone do trigger do controle

up		= gamepad_button_check(id_player , gp_padu);
down	= gamepad_button_check(id_player , gp_padd);
left	= gamepad_button_check(id_player , gp_padl);
right	= gamepad_button_check(id_player , gp_padr);

x_axis	= gamepad_axis_value(id_player, gp_axislh);
y_axis	= gamepad_axis_value(id_player, gp_axislv);

if ghost = false{
	if crown == true{
	interact =  gamepad_button_check_pressed(id_player, gp_face3);
	shoot = 0
	alt_shoot = 0
	} else {
	shoot	= gamepad_button_check(id_player, gp_face3) || gamepad_button_check(id_player, gp_shoulderrb);
	interact = 0
	alt_shoot	= gamepad_button_check(id_player, gp_face4) || gamepad_button_check(id_player, gp_shoulderlb);
	}
dash	= gamepad_button_check_pressed(id_player, gp_face2);
} else {interact = 0; dash = 0; shoot = 0; alt_shoot = 0}

axis_rh = gamepad_axis_value(id_player, gp_axisrh)
axis_rv = gamepad_axis_value(id_player, gp_axisrv)

if axis_rv != 0 and axis_rh != 0 {
aim_dir = point_direction(0, 0, axis_rh, axis_rv)
}

gamepad_set_color(id_player, make_color_rgb(color_0, color_1, color_2)) // caso contorle de ps4 a cor do controle muda para a cor do player

#endregion

} else {

#region //Caso for o teclado

up		= keyboard_check(ord("W"));
down	= keyboard_check(ord("S"));
left	= keyboard_check(ord("A"));
right	= keyboard_check(ord("D"));

if ghost = false{
	if crown == true{
	interact = mouse_check_button_pressed(mb_left);
	shoot = 0
	alt_shoot = 0
	} else {
	shoot = mouse_check_button(mb_left);
	interact = 0
	alt_shoot	= mouse_check_button(mb_right);
	}

dash	= keyboard_check_pressed(vk_shift);
} else {interact = 0; dash = 0; shoot = 0; alt_shoot = 0}

aim_dir = point_direction(x, centro_y, mouse_x, mouse_y);

#endregion

}

#region //Movimento do player

	if dash and dash_stack > 0{ // Caso botão de dash pressionado e o player tiver dash: dasha
		dash_stack--;
		spd_mod = dash_spd;
		imunity_delay = imunity_frames
		animation_locked = 1;
		sprite_index = s_PlayerDash}
		
	if dash_stack < dash_maxstack and dash_delay <= 0{dash_stack++; dash_delay = dash_cooldown;}
	if dash_stack < dash_maxstack {dash_delay--}

	//Direções
	var _mov_x = right - left + x_axis;
	var _mov_y = down - up + y_axis;
	
	// Direção que o player anda
	move_dir = point_direction( 0, 0, _mov_x, _mov_y);

	//Velocidades
	var _spd = 0;
	var _input_level = point_distance( 0, 0, _mov_x, _mov_y); // Pega seus input e os transforma sempre em positivo basicamente
	_input_level = clamp(_input_level, 0, 1); // (1) É um negocio que envolve um grafico de fisica, mas basicamente se x e y andar ao mesmo tempo a velocidade iria ser 1.4 vezes maior doque deveria
	_spd = spd*spd_mod * _input_level; // (2) essas quatro linhas evitam isso
	
	x_spd = lengthdir_x( _spd, move_dir ) + dash_x_spd; // (3)
	y_spd = lengthdir_y( _spd, move_dir ) + dash_y_spd; // (4)
	
	if weapon_dash_distance > 0 { //Ve se a arma tem dash
		weapon_dash_flag = 1
		animation_locked_dir = aim_dir;
		previous_distance_diference = point_distance(x, y, x+weapon_dash_distance, y+weapon_dash_distance)
		weapon_dash_distance = 0;
		x_prev = x;
		y_prev = y;
	}
	
	if weapon_dash_flag == 1{ //Faz um lerp entre as distancias
		
		x_spd = 0;
		x_lerp = lerp(0, x_prev - x + lengthdir_x(previous_distance_diference, animation_locked_dir), weapon_dash_vel);
		y_spd = 0;
		y_lerp = lerp(0, y_prev - y + lengthdir_y(previous_distance_diference, animation_locked_dir), weapon_dash_vel);
	
		if round(x_lerp) == 0 and round(y_lerp) == 0 {weapon_dash_flag = 0;}
		x_spd += x_lerp
		y_spd += y_lerp
	}

	// Adiciona a velocidade para o X e Y;
	if place_meeting(x+x_spd, y, o_CollisionHalf){ // Vê se esta batendo no objeto e faz pixel perfect
		while(!place_meeting(x+sign(x_spd), y, o_CollisionHalf)){
			x += sign(x_spd);
		}
		x_spd = 0;
		weapon_dash_flag = 0;
	}
	if place_meeting(x, y+y_spd, o_CollisionHalf){
		while(!place_meeting(x, y+sign(y_spd), o_CollisionHalf)){
			y += sign(y_spd);
		}
		y_spd = 0;
		weapon_dash_flag = 0;
	}
	
	x += x_spd;
	y += y_spd;
	
	dash_x_spd = 0;
	dash_y_spd = 0;
	
	if place_meeting(x, y, o_Collision) or place_meeting(x, y, o_CollisionHalf){
		
	x = irandom_range(room_width*0.2, room_width*0.8);
	y = irandom_range(room_height*0.2, room_height*0.8)
		
	}
	
#endregion

#region //Frames de imunidade e dano
	if imunity_delay <= 0 or ghost = true{
		image_alpha = 1
		spd_mod = 1;
		if (doDamageAnimation){ // Vê se esta batendo em algo que da dano
			imunity_delay = imunity_frames
			sprite_index = s_PlayerDamage
			animation_locked = 1;
			spd_mod = 0.25;

		
			damage_all = 0
				
			for (var i = 0; i < array_length(inst); i++) {
				damage_all += inst[i]
			}
				
			controller_vibration_left += damage_all/hp;
			controller_vibration_right += damage_all/hp;
			controller_vibration_time = max(30, controller_vibration_time);
				
			inst = []
			
			doDamageAnimation = false

		}
		
	} else {
		imunity_delay--
		image_alpha = 0.5
		doDamageAnimation = false
		}
	
#endregion

#region //Sprite control

if ghost_hp > hp {ghost_hp -= 0.5*max_hp/100*ghost_hp/(max(hp, 0.1))}
if hp < 1 and ghost == false{death = true};

if sign(_mov_x) != 0 {image_xscale = sign(_mov_x)*size}

if sprite_index = s_PlayerDamage and (image_index > image_number - 1) {animation_locked = 0};
if sprite_index = s_PlayerDash and imunity_delay <= 0 {animation_locked = 0};

if animation_locked != 1 {
	if _mov_x != 0 or _mov_y != 0{ 
		if (move_dir < 45 or move_dir > 315) || (move_dir > 135 and move_dir < 225){
			sprite_index = s_PlayerRunningX
		} else {sprite_index = s_PlayerRunningY}
	} else {sprite_index = s_PlayerStanding}
}

depth = -bbox_bottom;

if ghost == true{image_alpha = 0.1; spd_mod = 0.8; crown = false};

#endregion

}