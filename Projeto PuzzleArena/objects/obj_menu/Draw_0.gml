draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fnt_pixel)

var _gap = 140

for (var i = 0; i < array_length(menu[sub_menu]); i++) {	
	var _text_x = room_width/2
	var _text_y = room_height * .5 + _gap * i
	
	
	if (index == i) {
		selection.x = _text_x
		selection.y = _text_y
	}
	
	draw_text_transformed(_text_x, _text_y, menu[sub_menu][i], text_scale, text_scale, 0)
}