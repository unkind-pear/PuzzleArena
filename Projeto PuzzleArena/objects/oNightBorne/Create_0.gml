event_inherited()

// General variables
depth = -2
hp = 150
velocity = 3
melee_damage = 20
charge_melee_damage = 100
scale = 2.5
state = "chase"
melee_range = 48
target_was_in_range = false
type = "Attack-Player"

// Attack and chase variables
path = path_add()
charge_time = 1
range_attack_delay_time = 1
melee_attack_delay_time = 0.5
finished_charging = false

// Attack variables
melee_attack_delay_ended = false
range_attack_delay_ended = false
previous_distance_to_player = 0
previous_direction_to_target = 0
created_charging_animation = false
lerp_of_range_attack = 0.25


// Trail variables
current_trail = noone
prev_x = 0 
prev_y = 0
trail_scale = 0
distance_x = 0
distance_y = 0
instakill_attack_delay_ended = false
instakill_attack_delay = 0.1
not_ran_before = true

// Range charge attack code
waitFor(1, 1)

//Sprites
sprite_idle = sNightBorneIdle
sprite_walk = sNightBorneWalk
sprite_death = sNightBorneDeath
sprite_melee_attack = sNightBorneMeleeAttack

// Set Size
image_yscale = scale
image_xscale = scale

// Set range attack delay
waitFor(range_attack_delay_time, 1)

// Useful Functions
function targetInRange() {
	var _check = collision_circle(x, y, melee_range, target, false, true)
	if (_check == noone) {return false} else {return true}
}

function createChargingAnimation() {
	var _charge = instance_create_layer(x, y, "Enemies", oNightBorneCharge)
	with (_charge)
	{
		image_xscale = 1.5
		image_yscale = 1.5
		depth = -1
		parent = other
	}
}

function createTrail(dir) {
	var _trail = instance_create_layer(x, y, "Enemies", oNightBorneTrail)
	with (_trail)
	{
		image_angle = dir
		image_xscale = 0
		parent = other
	}
	return _trail
}