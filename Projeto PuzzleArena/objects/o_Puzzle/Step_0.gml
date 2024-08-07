if type == 0{
	real_result = count1 + count2
	count_type_display = " + "
} if type == 1{
	real_result = count1 - count2
		while justo == 0{
		real_result = count1 - count2
		if (real_result > 0){
			justo = 1
		} else {
			count1 = irandom(10)
			count2 = irandom(10)
		}
	}
	count_type_display = " - "
} if type == 2{
	real_result = count1 * count2
	count_type_display = " X "
} if type == 3{
	while justo == 0{
		real_result = count1 / count2
		if !(frac(real_result) > 0) and count2 != 0{
			justo = 1
			real_result = int64(real_result)
		} else {
			count1 = irandom(10)
			count2 = irandom(10)
		}
	}
	count_type_display = " / "
}

if Confirm == 1 and Wave_Can_Pass != 1{
	if result == real_result{
		Wave_Can_Pass = 1
	} else {
		Wave_Can_Pass = -1
		result = "Incorreto!"
	}
	Confirm = 0
}

if wave_is != o_EnemySpawner.wave{
	count1 = irandom(10)
	count2 = irandom(10)
	type = irandom(3)
	justo = 0
	real_result = 9999999999
	Wave_Can_Pass = 0;
	wave_is = o_EnemySpawner.wave
	result = ""
}