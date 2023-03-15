/// @description Spawn Bullet
/// @arg bullet object
/// @arg direction
/// @arg speed
/// @arg faction
/// @arg powerups
/// @arg* colour

function spawn_bullet(type, dir, spd, fact, pow, col = c_white){
	var origin = self;
	
	var power_combo;
	power_combo[0][0] = default_bullet;
	power_combo[1][0] = spread_bullet;
	power_combo[0][1] = scatter_bullet;
	power_combo[1][1] = spread_scatter_bullet;
	
	if (fact = factions.ally){
		if pow.rapid_shot {col = c_orange;}
		power_combo[pow.spread_shot][pow.scatter_shot](type, origin, fact, dir, spd, col);
	} else {
		col = c_red;
		power_combo[0][0](type, origin, fact, dir, spd, col);
	}
}

function default_bullet(type, origin, fact, dir, spd, col){
	//var bullet = instance_create_layer(x+lengthdir_x(18, image_angle), y+lengthdir_y(18, image_angle), "Instances", type);
	var bullet = instance_create_layer(x, y, "Instances", type);	
	with bullet {
		creator		= origin;
		faction		= fact;
		speed		= spd;
		direction	= dir;
		image_angle = dir;
		image_blend = col;
	}	
}

function spread_bullet(type, origin, fact, dir, spd, col){
	for (var i = -1; i <= 1 ; i++){
		var bullet = instance_create_layer(x, y, "Instances", type);
		with bullet {
			creator		= origin;
			faction		= fact;
			speed		= spd;
			direction	= dir + (i * 15);
			image_angle = dir + (i * 15);
			image_blend = col;
		}
	}
}

function scatter_bullet(type, origin, fact, dir, spd, col){
	for (var i = 0; i <= 3 ; i++){
		var bullet = instance_create_layer(x, y, "Instances", type);
		with bullet {
			creator		= origin;
			faction		= fact;
			speed		= spd;
			direction	= dir + (i * 90);
			image_angle = dir + (i * 90);
			image_blend = col;
		}
	}
}

function spread_scatter_bullet(type, origin, fact, dir, spd, col){
	for (var i = 0; i <= 7 ; i++){
		var bullet = instance_create_layer(x, y, "Instances", type);
		with bullet {
			creator		= origin;
			faction		= fact;
			speed		= spd;
			direction	= dir + (i * 45);
			image_angle = dir + (i * 45);
			image_blend = col;
		}
	}
}