var h;
var w;
if num_player <= 4{
	if num_player == 1{
		h = camera_get_view_height(view_camera[0])-40; w = camera_get_view_width(view_camera[0])-180;
		color_0 = (255); //cores
		color_1 = (255);
		color_2 = (255);
		vida = s_HealthBar1
		var hd = -20;
	}
	if num_player == 2{
		h = camera_get_view_height(view_camera[0])-40; w = 0;
		color_0 = (255); //cores
		color_1 = (0);
		color_2 = (0);
		vida = s_HealthBar2
		var hd = -20;
	}
	if num_player == 3{
		h = 20; w = camera_get_view_width(view_camera[0])-180;
		color_0 = (0); //cores
		color_1 = (255);
		color_2 = (0);
		vida = s_HealthBar3
		var hd = 30;
	}
	if num_player == 4{
		h = 20; w = 0;
		color_0 = (0); //cores
		color_1 = (0);
		color_2 = (255);
		vida = s_HealthBar4
		var hd = 30;
	}
	
for(var _i = 1; _i <= dash_maxstack; _i++){
	if (_i == 1){
	draw_sprite_ext(s_Dash, 0, w+_i*sprite_get_width(s_Dash)*2, h+hd, 2, 2, 0, c_white, 1);
	} else
	if (_i == dash_maxstack){
	draw_sprite_ext(s_Dash, 2, w+_i*sprite_get_width(s_Dash)*2, h+hd, 2, 2, 0, c_white, 1);
	} else{
	draw_sprite_ext(s_Dash, 1, w+_i*sprite_get_width(s_Dash)*2, h+hd, 2, 2, 0, c_white, 1);
	}
}
for(var _i = 1; _i <= dash_stack; _i++){
	if (_i == 1){
	draw_sprite_ext(s_Dash, 3, w+_i*sprite_get_width(s_Dash)*2, h+hd, 2, 2, 0, c_white, 1);
	} else
	if (_i == dash_maxstack){
	draw_sprite_ext(s_Dash, 5, w+_i*sprite_get_width(s_Dash)*2, h+hd, 2, 2, 0, c_white, 1);
	} else{
	draw_sprite_ext(s_Dash, 4, w+_i*sprite_get_width(s_Dash)*2, h+hd, 2, 2, 0, c_white, 1);
	}
	
	if dash_stack < dash_maxstack-1{draw_sprite_ext(s_Dash, 4, w+(_i+1)*sprite_get_width(s_Dash)*2, h+hd, 2, 2, 0, c_white, 1-(dash_delay/dash_cooldown));}
	if dash_stack+1 == dash_maxstack{draw_sprite_ext(s_Dash, 5, w+(_i+1)*sprite_get_width(s_Dash)*2, h+hd, 2, 2, 0, c_white, 1-(dash_delay/dash_cooldown));}
}
	if dash_stack == 0{draw_sprite_ext(s_Dash, 3, w+sprite_get_width(s_Dash)*2, h+hd, 2, 2, 0, c_white, 1-(dash_delay/dash_cooldown));}

draw_sprite_ext(vida, 1, w, h, 4, 4, 0, c_white, 1);
draw_sprite_part_ext(vida, 2, 0, 0, sprite_get_width(vida)*(ghost_hp/max_hp), sprite_get_height(vida), w, h, 4, 4, c_white, 1);
draw_sprite_part_ext(vida, 0, 0, 0, sprite_get_width(vida)*(hp/max_hp), sprite_get_height(vida), w, h, 4, 4, c_white, 1);
}