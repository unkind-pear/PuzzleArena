if (!stop) {
	if (instance_exists(target)) {
		x = target.x
		y = target.y
	}
	else {
		stop = true
	}
}

if (animationOnFrame(5)) {
	stop = true	
}

if (animationOnFrame(6)) {
	stop = true	
}

if (animationOnFrame(7)) {
	doDamage(instance_place(x, y, o_Player), damage)
}

if (animationFinished()) {instance_destroy()}

if(true) {
	image_alpha += 0.08; //higher numbers mean faster fade times
} 