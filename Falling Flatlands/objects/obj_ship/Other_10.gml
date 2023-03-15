/// @description Take Damage

// Cancel damage if shield is active.
if ship_shield_enabled {
	audio_play_sound(choose(
	SFX__FTL____Shield_Hit_Impact__A_,
	SFX__FTL____Shield_Hit_Impact__B_,
	SFX__FTL____Shield_Hit_Impact__C_
	), 10, false)	
	exit;
}
if ship_iframes exit;

// Change health.
ship_hp -= 1;
if ship_hp == 1{
	audio_play_sound(UI__ITB____Critical_Health, 10, false);
}

if ship_hp <= 0 {
	instance_destroy();
	exit;
}

audio_play_sound(SFX__ITB____Ship_Damage, 10, false);

iframe = 0;
ship_iframes = true;
alarm[3] = room_speed * 0.1;