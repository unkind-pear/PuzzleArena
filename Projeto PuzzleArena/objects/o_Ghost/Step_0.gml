
image_xscale = size
image_yscale = size

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


#endregion

} else {

#region //Caso for o teclado

up		= keyboard_check(ord("W"));
down	= keyboard_check(ord("S"));
left	= keyboard_check(ord("A"));
right	= keyboard_check(ord("D"));

#endregion

}

#region //Movimento do player

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
	
	x_spd = lengthdir_x( _spd, move_dir ); // (3)
	y_spd = lengthdir_y( _spd, move_dir ); // (4)

	// Adiciona a velocidade para o X e Y;
	if place_meeting(x+x_spd, y, o_CollisionHalf){ // Vê se esta batendo no objeto e faz pixel perfect
		while(!place_meeting(x+sign(x_spd), y, o_CollisionHalf)){
			x += sign(x_spd);
		}
		x_spd = 0;
	}
	if place_meeting(x, y+y_spd, o_CollisionHalf){
		while(!place_meeting(x, y+sign(y_spd), o_CollisionHalf)){
			y += sign(y_spd);
		}
		y_spd = 0;
	}
	
	x += x_spd;
	y += y_spd;
	
	if place_meeting(x, y, o_Collision) or place_meeting(x, y, o_CollisionHalf){
		
	x = irandom_range(room_width*0.2, room_width*0.8);
	y = irandom_range(room_height*0.2, room_height*0.8)
		
	}
	
#endregion

#region //Sprite control

if sign(_mov_x) != 0 {image_xscale = sign(_mov_x)*size}

if sprite_index = s_PlayerDamage and (image_index > image_number - 1) {animation_locked = 0};

if animation_locked != 1 {
	if _mov_x != 0 or _mov_y != 0{ 
		if (move_dir < 45 or move_dir > 315) || (move_dir > 135 and move_dir < 225){
			sprite_index = s_PlayerRunningX
		} else {sprite_index = s_PlayerRunningY}
	} else {sprite_index = s_PlayerStanding}
}

depth = -bbox_bottom;

if ghost == true{image_alpha = 0.1; spd_mod = 0.8};

#endregion