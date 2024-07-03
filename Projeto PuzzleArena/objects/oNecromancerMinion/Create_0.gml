event_inherited()

// General variables
depth = -2
image_alpha = 0
hp = 150
melee_damage = 5
range_damage = 1
velocity = 2
scale = 1.8
state = "spawning"
melee_attack_range = 12
range_attack_range = 20
type = "Attack-Player" // Mudar

// Attack and chase variables
path = path_add()

// Attack variables
melee_attack_delay_ended = true
range_attack_delay_ended = true

//Sprites
sprite_walk = sNecromancerMinionWalk
sprite_range_attack = sNecromancerMinionRangeAttack
sprite_melee_attack = sNecromancerMinionMeleeAttack
sprite_idle = sNecromancerMinionIdle
sprite_death = sNecromancerMinionDeath

// Set Size
image_yscale = scale
image_xscale = scale

// Useful Functions
function targetInRange(range) {
	var _check = collision_rectangle(x + range*image_xscale, y + 9*image_yscale, x - range*image_xscale, y - 9*image_yscale, target, false, true)
	if (_check == noone) {return false} else {return true}
}