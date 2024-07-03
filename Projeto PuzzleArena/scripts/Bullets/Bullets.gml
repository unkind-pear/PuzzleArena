function CreateBullet(_bullet_damage, _bullet_sprite, _bullet_pierce, _bullet_bounce, _bullet_life_time, _bullet_travel_speed, _bullet_number, _bullet_spread, _random_speed, _random_spread) constructor{
	bullet_damage = _bullet_damage				//Dano
	bullet_sprite = _bullet_sprite				//Sprite da bala. S_Bullet, [S_Bullet1, S_Bullet2}
	bullet_pierce = _bullet_pierce				
	bullet_bounce = _bullet_bounce			
	bullet_life_time = _bullet_life_time		//Tempo de vida.
	bullet_travel_speed = _bullet_travel_speed	//Velocidade da bala
	bullet_number =	_bullet_number				//Quantidade de balas
	bullet_spread = _bullet_spread				//Separação das balas
	random_speed = _random_speed				//Randomizador de velocidade
	random_spread = _random_spread				//Randomizador da sepração

}

global.bullet_list = {
	uzi : new CreateBullet(5, [s_BulletUzi], 0, 2, 1000 , 8, 1, 0, 0, 0),
	alt_uzi : new CreateBullet(10, [s_BulletUzi], 0, 1, 1000, 8, 30, 360, 0, 0),
	flame : new CreateBullet(0.5, [s_BulletFlame], 999, 0, 20, 3, 2, 0, 0.2, 10),
	alt_flame : new CreateBullet(20, [s_BulletFlame], 999, 0, 40, 6, 60, 360, 0, 0),
	knife : new CreateBullet(10, [s_BulletKnife], 10, 3, 5, 10, 1, 0, 0, 0),
	alt_knife : new CreateBullet(100, [s_BulletKnifeBig], 10, 100, 1000, 2, 1, 0, 0, 0),
	katana : new CreateBullet(25, [s_BulletKatana2], 999, 0, "animation", "locked", 1, 3, 0.2, 4),
	alt_katana : new CreateBullet(0.25, [s_BulletKatana, s_BulletKatana2, s_BulletKatana3], 999, 0, 20, 25, 500, 0, 0.9, 4)
}