/// @description Spawn laser
/// @arg angle
/// @arg faction
/// @arg powerups

function spawn_orbitor_laser(ang, fact, pow, col = c_white){
	var origin = self;
	if pow.rapid_shot {
		col = c_orange;
		ang += 1;
	}
	var power_combo;
	power_combo[0][0] = default_laser;
	power_combo[1][0] = spread_laser;
	power_combo[0][1] = scatter_laser;
	power_combo[1][1] = spread_scatter_laser;

	power_combo[pow.spread_shot][pow.scatter_shot](origin, fact, ang, col);
}


function default_laser(origin, fact, ang, col){
	var laser = instance_create_layer(x, y, "Instances", obj_laser);	
	with laser {
		creator		= origin;
		faction		= fact;
		angle_offset= ang;
		image_blend = col;
	}	
}

function spread_laser(origin, fact, ang, col){
	for (var i = -1; i <= 1 ; i++){
		var laser = instance_create_layer(x, y, "Instances", obj_laser);
		with laser {
			creator		= origin;
			faction		= fact;			
			angle_offset= ang + (i * 35);
			image_blend = col;
		}
	}
}

function scatter_laser(origin, fact, ang, col){
	for (var i = 0; i <= 3 ; i++){
		var laser = instance_create_layer(x, y, "Instances", obj_laser);
		with laser {
			creator		= origin;
			faction		= fact;			
			angle_offset= ang + (i * 90);
			image_blend = col;
		}
	}
}

function spread_scatter_laser(origin, fact, ang, col){
	for (var i = 0; i <= 7 ; i++){
		var laser = instance_create_layer(x, y, "Instances", obj_laser);
		with laser {
			creator		= origin;
			faction		= fact;
			angle_offset= ang + (i * 45);
			image_blend = col;
		}
	}
}