WaveMaker[0] = [60, 1, [[oBringuerOfDeath, 1]]];	//Dalay entre spwan, numero de inimigos, lista de inimigos = [[inimigo, spawnrate], [oInimigo, 0.8]]
WaveMaker[1] = [80, 5, [[oBringuerOfDeath, 1]]];
WaveMaker[2] = [120, 8, [ [oBringuerOfDeath, 80],[oNecromancer, 20] ]];
WaveMaker[3] = [80, 15, [ [oBringuerOfDeath, 70], [oNecromancer, 30] ]];
WaveMaker[4] = [120, 12, [ [oBringuerOfDeath, 50], [oNightBorne, 25], [oNecromancer, 25] ]];
WaveMaker[5] = [60, 20, [ [oBringuerOfDeath, 1], [oNightBorne, 1], [oNecromancer, 1] ]];
WaveMaker[6] = [50, 20, [ [oBringuerOfDeath, 1], [oNightBorne, 1], [oNecromancer, 1] ]];

#region //Variaveis dinamicas
rand_x = 0;
rand_y = 0;

wave = 0;
dalay = WaveMaker[wave][0];
dalay_max = WaveMaker[wave][0];
inimigos = WaveMaker[wave][2];
inimigos_max = 0;
can_run = true;

bonus_timer = 0;
#endregion