function UpgradePick(_Upgrade_id, _player, _give){
	if _Upgrade_id == 0{
		if _give == true{
			_player.damageMod = _player.damageMod + 0.2
		}
		return ("+20% de dano!");
	}
	if _Upgrade_id == 1{
		if _give == true{
			_player.bulletMod = _player.bulletMod + 1
		}
		return ("+1 bala atirada");
	}
	if _Upgrade_id == 2{
		if _give == true{
			_player.spd = _player.spd + 1
		}
		return ("+1 de velocidade!");
	}
	if _Upgrade_id == 3{
		if _give == true{
			_player.pierceMod = _player.pierceMod + 1
		}
		return ("As balas atravessam +1 inimigo!");
	}
	if _Upgrade_id == 4{
		if _give == true{
			_player.bounceMod = _player.bounceMod + 1
		}
		return ("As balas rebatem +1 vez da parede");
	}
	if _Upgrade_id == 5{
		if _give == true{
			_player.lifeMod = _player.lifeMod + 1
		}
		return ("Aumento de 100% no tempo de vida da bala");
	}
	if _Upgrade_id == 6{
		if _give == true{
			_player.travelMod = _player.travelMod + 0.5
		}
		return ("Aumento de 50% da velocidade da bala");
	}
	if _Upgrade_id == 7{
		if _give == true{
			_player.spreadMod = _player.spreadMod*0.5
		}
		return ("Reduz o espalhamento de balas em 50%");
	}
	if _Upgrade_id == 8{
		if _give == true{
			_player.randomMod = _player.randomMod*0.5
		}
		return ("Diminui a randomização das balas (efeito minimo, recomendamos que nao pegue esse upgrade)");
	}
	if _Upgrade_id == 9{
		if _give == true{
			_player.cooldownMod = _player.cooldownMod*0.8
		}
		return ("Diminui o coldowm por 20%");
	}
	if _Upgrade_id == 10{
		if _give == true{
			_player.hp = (_player.hp + 10)*1.2
			_player.max_hp = (_player.max_hp + 10)*1.2
		}
		return ("Aumenta o Hp (20%) e cura um pouco de vida");
	}
	if _Upgrade_id == 11{
		if _give == true{
			_player.dash_spd = _player.dash_spd + 1
		}
		return ("Aumenta a velocidade do dash em +1");
	}
	if _Upgrade_id == 12{
		if _give == true{
			_player.dash_cooldown = _player.dash_cooldown*0.8
		}
		return ("Diminui o dalay para recuperar o dash em 20%");
	}
	if _Upgrade_id == 13{
		if _give == true{
			_player.dash_maxstack = _player.dash_maxstack + 1
		}
		return ("Aumenta o maximo de dash que pode ter em +1");
	}
	if _Upgrade_id == 14{
		if _give == true{
			_player.imunity_frames = _player.imunity_frames + 10
		}
		return ("Aumenta os frames de imunidade em +10");
	}
}