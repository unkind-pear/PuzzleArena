event_inherited()

if (image_index >= image_number - 1) {instance_destroy()}

image_blend = c_red

depth = -1

if (place_meeting(x, y, o_Player)) {
	doDamage(instance_place(x, y, o_Player), 50)
}