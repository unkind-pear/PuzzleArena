if bullet_travel_speed != "locked" {
if bullet_life_time_max == 0 {bullet_life_time_max = bullet_life_time; bullet_travel_speed_max = bullet_travel_speed}

var _x_spd = lengthdir_x( bullet_travel_speed, image_angle );
var _y_spd = lengthdir_y( bullet_travel_speed, image_angle );

x += _x_spd;
y += _y_spd;


if place_meeting(x + _x_spd, y + _y_spd, o_Collision) {
		if place_meeting(x + _x_spd, y + _y_spd, o_Collision){
			image_angle = image_angle+180
			bullet_bounce--
	}

}

} else {

x = player.x + gun.x_offset;
y = player.y + gun.y_offset;

image_angle = gun.image_angle;

image_yscale = -sign(gun.weapon_angle_mod);
image_xscale = 1.5;

}

if bullet_life_time != "animation"{

bullet_life_time--

if bullet_travel_speed != "locked"{
if (bullet_life_time/bullet_life_time_max) > 0.2{
bullet_travel_speed = bullet_travel_speed_max*(bullet_life_time/bullet_life_time_max)
} else {bullet_travel_speed = bullet_travel_speed_max*0.2}
}

if bullet_life_time < 0 or bullet_pierce < 0 or bullet_bounce < 0{
	destroy = true;
}

} else if image_index >= image_number - 1{instance_destroy(self)} 


if destroy == true{instance_destroy(self)}