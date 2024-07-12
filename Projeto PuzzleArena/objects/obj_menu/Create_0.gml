menu[0, 0] = "Start"
menu[0, 1] = "Options"
menu[0, 2] = "Exit"

// options

menu[1, 0] = "Controls"
menu[1, 1] = "Graphics"
menu[1, 2] = "Sound"
menu[1, 3] = "Back"

index = 0
sub_menu = 0

text_scale = 1.5

selection = collision_rectangle(0, 0, room_width, room_height, obj_button_selection, false, true)

input_delay_ended = true