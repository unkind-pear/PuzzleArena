if o_EnemySpawner.can_run == true{

draw_set_font(fnt_pixel)
draw_set_color(c_gray)
draw_set_halign(fa_left)
draw_text_transformed(room_w, room_h-80, string_concat(real(count1), count_type_display , real(count2)), 0.5, 0.5, 0);
draw_set_color(c_black)
draw_set_halign(fa_right)
draw_text_transformed(room_w, room_h-80, result, 0.5, 0.5, 0);
draw_set_halign(fa_center)

}