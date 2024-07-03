if wave+1 == array_length(WaveMaker){
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(room_width/2, room_height/2-160, "VOCE VENCEU!!!")
	draw_text(15, 15, bonus_timer);
} else {
draw_text(15, 15, WaveMaker[wave][1]-inimigos_max);
draw_text(15, 30, wave);
}