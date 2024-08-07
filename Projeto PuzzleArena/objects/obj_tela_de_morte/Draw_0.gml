draw_self()

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fnt_pixel)

var _gap = 220

draw_text_transformed_color(room_width/2, room_height*.3, "You Died", 2, 2, 0, c_red, c_red, c_red, c_red, image_alpha2)

for (var i = 0; i < array_length(menu); i++) {	
	var _text_x = room_width/2
	var _text_y = room_height * .6 + _gap * i
	
	
	if (index == i) {
		draw_text_transformed_color(_text_x, _text_y, menu[i], text_scale, text_scale, 0, c_gray, c_gray, c_gray, c_gray, image_alpha2)
	}
	else {
		draw_text_transformed_color(_text_x, _text_y, menu[i], text_scale, text_scale, 0, c_white, c_white, c_white, c_white, image_alpha2)
	}
}

draw_set_font(-1)