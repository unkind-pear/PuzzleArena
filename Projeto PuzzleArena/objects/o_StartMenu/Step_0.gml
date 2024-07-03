up		= keyboard_check_pressed(ord("W"));
down	= keyboard_check_pressed(ord("S"));
enter	= keyboard_check_pressed(vk_space);

if up {
	if option_choose-1 < 0{
		option_choose = array_length(option[menu_area])-1
	} else {option_choose -= 1}
}
if down {
	if option_choose+1 > array_length(option[menu_area])-1{
		option_choose = 0
	} else {option_choose += 1}
}

for(var _i = 0; _i < array_length(option[menu_area]); _i++){

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	if mouse_x >= room_w-40 and mouse_x < room_w+40{
		if mouse_y >= room_h-15+50*_i and mouse_y < room_h+20+50*_i{
			option_choose = _i
			
			if mouse_check_button_pressed(mb_left){ mouse_clicked = 1 }
		}
	}

}

if enter or mouse_clicked == 1{
	mouse_clicked = 0;
	switch menu_area{
		case 0: //Menu Principal
			switch option_choose{
				case 0:
					room_goto(Arena)
				break;
			
				case 1:
					menu_area = 1
					option_choose = 0
				break;
			
				case 2:
					game_end();
				break;
			}
		break;
		
		case 1: //Menu de opções
			switch option_choose{
				case 0:
				break;
			
				case 1:
				break;
			
				case 2:
					menu_area = 0;
					option_choose = 0;
				break;
			}
		break;
	
	}
}