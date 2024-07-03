for(var _i = 0; _i < array_length(option[menu_area]); _i++){

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	if _i == option_choose {
		draw_set_color(c_white)
	} else {
		draw_set_color(c_blue)
	}
	draw_rectangle(room_w-40, room_h-15+50*_i, room_w+40, room_h+20+50*_i, true)
	
	
	draw_set_color(c_black)
	
	
	draw_text(room_w, room_h+50*_i, option[menu_area, _i])
	
}

draw_set_color(c_white)

if o_Stats.Score <= 0{
	if o_Stats.Wave > 0{
		draw_text(room_w+200, room_h-35, "Wave maxima: " + string(o_Stats.Wave))
	} else {
		draw_text(room_w+200, room_h-35, "Sem dados registrados!")
	}
} else {
	draw_text(room_w+200, room_h-35, "Maximo de pontos: " + string(o_Stats.Score))
}