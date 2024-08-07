if (input_delay_ended) {	
	var _up = keyboard_check(vk_up) or keyboard_check(ord("W")) or gamepad_button_check(0, gp_padu) or gamepad_axis_value(0, gp_axislv) < -0.5;
	var _down = keyboard_check(vk_down) or keyboard_check(ord("S")) or gamepad_button_check(0, gp_padd) or gamepad_axis_value(0, gp_axislv) > 0.5;

	var _move = _down - _up;
	if (_move != 0) {
	    index += _move;
    
	    var _size = array_length(menu);
	    if (index < 0) { index = 0; }
	    else if (index >= _size) { index = _size - 1; }
        
	    input_delay_ended = false;
	    waitFor(0.2, 0);
	}
}

var _select = false

if (!stop) {
	_select = keyboard_check(vk_enter) or keyboard_check(vk_space) or gamepad_button_check(0, gp_face1);
}

if (_select) {
	switch (index) {
	    case 0:
			instance_create_layer(x, y, "Instances", obj_room_transition)
			stop = true

	        break;
	    case 1:
	        game_end();
	        break;

	}
}
