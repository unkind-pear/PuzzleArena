target_x = 0
target_y = 0
target = noone

flash_sprite = false
direction_to_target = 0

function doDamage(target, damage) {
	if (instance_exists(target)) {
		if target.imunity_delay <= 0{
			if (!is_array(target)) {
				target.hp -= damage
				target.doDamageAnimation = true
				array_push(target.inst, damage)
			
				flash_sprite = true
			}
		}
	}
}

damage_list_old = ds_list_create();
list_reseter_dalay = 30
list_reseter = list_reseter_dalay