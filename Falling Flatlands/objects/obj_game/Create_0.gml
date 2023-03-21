score = 0;
lives = 3;

// Time Modifier for slow-mo effects. Develop Later.
global.time_modifier = 1;

draw_set_font(fnt_text);
audio_master_gain(0.5);

randomize();

enum factions {
	player,
	ally,
	neutral,
	enemy
}