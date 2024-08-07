draw_self(); //Player

image_blend = make_color_rgb(color_0, color_1, color_2); //Cor do player
draw_text(x-5, y-50, num_player); //Player numero

#region //old

if num_player > 4{

for(var _i = 1; _i <= dash_maxstack; _i++){
	draw_sprite(dash_metter, 0, x+(sprite_get_width(dash_metter)*1.5*_i)-(sprite_get_width(dash_metter)*dash_maxstack), y-30);
}
for(var _i = 1; _i <= dash_stack; _i++){
	draw_sprite_ext(dash_metter, 1, x+(sprite_get_width(dash_metter)*1.5*_i)-(sprite_get_width(dash_metter)*dash_maxstack), y-30, 1, 1, 0, image_blend, 1);
}
if dash_stack <= dash_maxstack {
	draw_sprite_ext(dash_metter, 1, x+(sprite_get_width(dash_metter)*1.5*(dash_stack+1))-(8*dash_maxstack), y-30, 1, 1, 0, image_blend, 1-(dash_delay/dash_cooldown));}

draw_healthbar(x-15-wi/2, y-17, x+15+wi/2, y-25, max((ghost_hp / max_hp), 0) * 100,c_black, c_white, c_white, 0, true, true); //Vida branca
draw_healthbar(x-15-wi/2, y-17, x+15+wi/2, y-25, max((hp / max_hp), 0) * 100,c_black, c_red, image_blend, 0, false, false); //Vida padrao

}

if crown == true{
	draw_sprite_ext(sCrown, 0, x, y, size, size, 0, make_color_rgb(color_0, color_1, color_2), image_alpha)
}