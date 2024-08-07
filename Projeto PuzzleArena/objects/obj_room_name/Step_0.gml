image_xscale = lerp(image_xscale, 4, 0.2)
image_yscale = lerp(image_yscale, 4, 0.2)

if (go_away) {
	image_alpha = lerp(image_alpha, 0, 0.1)
	
	if (((image_alpha - 1) * -1) < 0.1) {instance_destroy()}
}

