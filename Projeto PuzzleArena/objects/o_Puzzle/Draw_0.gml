if o_EnemySpawner.can_run == true{

draw_set_color(c_gray)
draw_set_halign(fa_left)
draw_text(room_w-70, room_h-80, string_concat(real(count1), count_type_display , real(count2)));
draw_set_color(c_black)
draw_set_halign(fa_right)
draw_text(room_w+70, room_h-80, result);
draw_set_halign(fa_center)

}