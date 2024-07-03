function sphere_raycast(x1, y1, x2, y2, radius, _direction) {
    var size = point_distance(x1, y1, x2, y2) div radius;
    for (var i = 1; i <= size; i++) {
        var new_x = x1 + lengthdir_x(radius * i, _direction);
        var new_y = y1 + lengthdir_y(radius * i, _direction);
        if (collision_circle(new_x, new_y, radius, oWall, false, true) != noone) {
            return true;
        }
    }
    return false;
}

function inAttackDistance(x1, y1, x2, y2, distance) {
	if (point_distance(x1, y1, x2, y2) < distance) {return true} else {return false}
}

function flipSprite(dir, scale) {
	if (dir > 90 and dir <= 270) {image_xscale = scale} else {image_xscale = -scale}
}

function animationFinished() {
	if (image_index >= image_number - 1) {return true} else {return false}
}

function animationOnFrame(frame) {
	if (image_index >= frame && image_index <= frame + 1) {return true} else {return false}
}

function waitFor(seconds, alarm_number) {
	alarm[alarm_number] = seconds*room_speed
}

function whatQuadrantIsItIn(angle) {
	if (angle >= 0 and angle < 90) {
		return 1
	}
	else if (angle >= 90 and angle < 180) {
		return 2
	}
	else if (angle >= 180 and angle < 270) {
		return 3
	}
	else {
		return 4
	}
}
function ControllerVibration(_controler, _force_left, _force_right){
	if _controler > -1{
		gamepad_set_vibration(_controler, _force_left, _force_right);
	}
}

function isInsideRoomAndIsNotColliding(instance) {
	if (place_meeting(instance.x, instance.y, o_Collision)) {
		return false
	}
	else {
		return true
	}
}