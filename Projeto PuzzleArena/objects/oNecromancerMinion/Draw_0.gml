if (state != "spawning") {
	draw_self()
}
else {
	gpu_set_fog(true, c_purple, 0, 1000)
	draw_self()
	gpu_set_fog(false, c_purple,0,1000)
}

//draw_rectangle(x + 20*image_xscale, y + 9*image_yscale, x - 2.5*image_xscale, y - 9*image_yscale, true)
//draw_rectangle(x + melee_attack_range*image_xscale, y + 9*image_yscale, x - melee_attack_range*image_xscale, y - 9*image_yscale, true)
//draw_rectangle(x + range_attack_range*image_xscale, y + 9*image_yscale, x - range_attack_range*image_xscale, y - 9*image_yscale, true)