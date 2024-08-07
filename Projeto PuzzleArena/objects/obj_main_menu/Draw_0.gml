draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fnt_pixel)

var _gap = 220

for (var i = 0; i < array_length(menu); i++) {	
	var _text_x = room_width/2
	var _text_y = room_height * .6 + _gap * i
	
	
	if (index == i) {
		if (selection != noone) {
			selection.prev_x = selection.x
			selection.prev_y = selection.y
		
			selection.x = _text_x
			selection.y = _text_y
		} else {
			selection = instance_create_layer(_text_x, _text_y, "Instances", obj_button_selection, {prev_x : _text_x, prev_y : _text_y})
		}
		

	}
	
	//if string_width()
	
	draw_text_transformed(_text_x, _text_y, menu[i], text_scale, text_scale, 0)
}

draw_set_font(-1)