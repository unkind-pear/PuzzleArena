event_inherited()

// General variables
hp = 250
velocity = 1
melee_damage = 10
spell_damage = 2
scale = 2.2
state = "chase"
melee_range = 128
type = "Attack-Player"

// Attack and chase variables
path = path_add()

// Attack variables
melee_attack_delay_ended = true
range_attack_delay_ended = true

//Sprites
sprite_walk = sBringuerOfDeathWalk
sprite_range_attack = sBringuerOfDeathRangeAttack
sprite_melee_attack = sBringuerOfDeathMeleeAttack
sprite_idle = sBringuerOfDeathIdle
sprite_death = sBringuerOfDeathDeath

// Set Size
image_yscale = scale
image_xscale = scale

// Useful Functions
function targetInRange() {
	var _check = collision_rectangle(x - melee_range, y + melee_range/2, x + melee_range, y - melee_range/2, target, false, true)
	if (_check == noone) {return false} else {return true}
}

function createSpell() {
	var _spell = instance_create_layer(target.x, target.y, "Enemies", oBringuerOfDeathSpell) // Criar spell
	with (_spell)
	{
		target = other.target
		damage = other.spell_damage
		 
		image_xscale = 1.5
		image_yscale = 1.5
	}
}