function doDamage(target, damage) {
	if (instance_exists(target)) {
		if (!is_array(target)) {
			target.hp -= damage
			target.doDamageAnimation = true
			array_push(target.inst, damage)
		}
	}
}