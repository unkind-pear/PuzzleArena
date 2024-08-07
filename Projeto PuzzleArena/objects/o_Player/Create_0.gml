randomize();		//Randomizar sempre

max_hp = 1;				//HP
spd = 7;					//Velocidade
dash_spd = 2;				//Multiplicador de velocidade do Dash
dash_cooldown = 60;			//Cooldown do Dash
dash_maxstack = 3;			//Dash Stack
imunity_frames = 15;		//ImunityFrames
lv = 0;

size = 1.5					//tamanho do player

dash_metter = s_DashOld

centro_y_offset = -5;		//Distancia Y entre o player e a arma

doDamageAnimation = false //Andrew
inst = [] //Andrew

#region //Variaveis dinamicas

#region //Botões
up = 0;
down = 0;
left = 0;
right = 0;
shoot = 0;
alt_shoot = 0;
interact = 0;
dash = 0;
aim_dir = 0;
x_axis = 0;
y_axis = 0;
axis_rv = 0;
axis_rh = 0;
#endregion

//Moviemento
x_spd = 0;
y_spd = 0;
spd_mod = 1; //Modificador de velocidade

//Dash
dash_delay = dash_cooldown;
dash_stack = dash_maxstack;

//Player Control
crown = false;
ghost = false;
animation_locked = 0;
death = 0;
hp = max_hp;
ghost_hp = hp;

color_0 = irandom(255); //cores
color_1 = irandom(255);
color_2 = irandom(255);

alt_effect_cooldown = 30;
alt_effect_delay = 0;

//Controle 
id_player = 0;
num_player = 0;
controller_vibration_left = 0;
controller_vibration_right = 0;
controller_vibration_time = 0;

ud = 1;
move_dir = 0;
locked_dir = aim_dir;
imunity_delay = 0;
wi = sprite_width;
vida = s_HealthBar1
x_prev = x;
y_prev = y;
previous_distance_diference = 0;
centro_y = 0;
armado = false;

//DashArma
weapon_dash_distance = 0;
weapon_dash_vel = 0;
weapon_dash_flag = 0;
animation_locked_dir = 0;
x_lerp = 0;
y_lerp = 0;
dash_x_spd = 0;
dash_y_spd = 0;

//ArmaMod
damageMod = 1
pierceMod = 0
bounceMod = 0
lifeMod = 1
travelMod = 1
bulletMod = 0
spreadMod = 1
randomMod = 1
cooldownMod = 1


//Revive
revive = 1
#endregion