event_inherited()

// General variables
hp = 150
melee_damage = 10
portal_damage = 1
velocity = 2
scale = 1.8
state = "chase" // Tá mais pra idle
attack_player_range = 200 // If player gets in this range, attack it
type = "Attack-Player"
delay_between_magic_ball_attacks = 1.5

// Portal Variables
portal_spawn_range = 128
delay_to_spawn_enemy_on_portal = 3
portal_attack_delay = 4 // Delay to spawn portal

// Attack and chase variables
path = path_add()

// Attack variables
melee_attack_delay_ended = true
portal_attack_delay_ended = true

//Sprites
sprite_walk = sNecromancerWalk
sprite_range_attack = sNecromancerRangeAttack
sprite_melee_attack = sNecromancerMeleeAttack
sprite_idle = sNecromancerIdle
sprite_death = sNecromancerDeath

// Set Size
image_yscale = scale
image_xscale = scale

// Useful Functions
function targetInRange() {
	var _check = collision_circle(x, y, attack_player_range, target, false, true)
	if (_check == noone) {return false} else {return true}
}

function createSpell(dir) {
	var _spell = instance_create_layer(x, y, 0, oNecromancerBullet) // Create spell
	with (_spell)
	{
		target = other.target
		velocity = 6

		direction = dir
		image_angle = dir
		 
		image_xscale = 1.5
		image_yscale = 1.5
		
		image_blend = c_red
	}
}

function createPortal(point_x, point_y) {
	//var _portal = instance_create_layer(point_x, point_y, 0, oNecromancer) //Chaos
	var _portal = instance_create_layer(point_x, point_y, "Enemies", oNecromancerPortal) // Create portal
	with (_portal)
	{
		delay = other.delay_to_spawn_enemy_on_portal
		 
		image_xscale = 1.5
		image_yscale = 1.5
	}
	if (!isInsideRoomAndIsNotColliding(_portal)) {
		instance_destroy(_portal)
		return false
	}
	else {
		return true
	}
}