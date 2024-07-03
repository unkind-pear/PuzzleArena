// Move
x += lengthdir_x(velocity, direction)
y += lengthdir_y(velocity, direction)

//if (place_meeting(x, y, oWall)) {
	//velocity = 0
	//sprite_index = sprite_destroy
//}
if (place_meeting(x, y, o_Player)) {
	doDamage(instance_place(x, y, o_Player), damage)
	velocity = 0
	sprite_index = sprite_destroy
}

if (sprite_index = sprite_destroy and animationFinished()) {
    instance_destroy()
}

