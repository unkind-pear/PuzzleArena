if (!instance_exists(parent)) {
	image_alpha -= 0.1
	
	if (image_alpha <= 0) {
		instance_destroy()
	}
}