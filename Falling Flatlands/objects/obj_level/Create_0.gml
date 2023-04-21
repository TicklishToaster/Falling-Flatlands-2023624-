score = 0;
lives = 3;

// Time Modifier for slow-mo effects. Develop Later.
global.time_modifier = 1;

//draw_set_font(fnt_text);
//audio_master_gain(0.5);

randomize();

enum factions {
	player,
	ally,
	neutral,
	enemy
}


show_debug_overlay(true)
window_set_caption("Falling Flatlands")
//instance_create_layer(x, y, "Backgrounds_1", obj_background);


player_ship			= obj_game.selected_ship_id;
level_id			= obj_game.selected_level_id;
condition_data		= obj_game.level_data_conditions;
enemy_pool			= obj_game.level_enemy_data_pool;
enemy_density		= obj_game.level_enemy_data_density;

level_size				= condition_data[level_id][0];
condition_win_portal	= condition_data[level_id][1];
condition_win_key		= condition_data[level_id][2];
condition_win_enemy		= condition_data[level_id][3];
condition_win_complete_portal	= false;
condition_win_complete_key		= false;
condition_win_complete_enemy	= false;

condition_portal_hidden		= condition_data[level_id][4];
condition_key_number_max	= condition_data[level_id][5];
condition_key_number		= 0;
condition_key_list			= [];
condition_enemy_number_max	= condition_data[level_id][6];
condition_enemy_number		= 0;

//level_data_conditions = [
//	//Level Size	Portal	Key		Enemy	PHide		K-Max	E-Max	E-Density
//  //[10,			true,	true,	true,	false,		00,		00,		[3, 3]], // Lvl 00 
//	[10,			true,	false,	false,	false,		00,		00,		[1, 2]], // Lvl 01	Hunter Introduction
//	[10,			true,	false,	false,	false,		00,		00,		[0, 3]], // Lvl 02	Hunter Markup
//	[10,			false,	true,	false,	false,		02,		00,		[0, 2]], // Lvl 03	Charger Introduction
//	[10,			false,	true,	false,	false,		03,		00,		[1, 2]], // Lvl 04	Charger Markup
//	[10,			true,	false,	true,	true,		00,		32,		[1, 3]], // Lvl 05	//Hunter X Charger//
//	[10,			false,	false,	true,	false,		00,		16,		[1, 2]], // Lvl 06	Swarmer Introduction
//	[10,			true,	false,	false,	false,		00,		00,		[1, 1]], // Lvl 07	Swarmer Heavy
//	[10,			true,	false,	false,	false,		00,		00,		[2, 3]], // Lvl 08	Hunters & Swarmers
//	[10,			false,	true,	false,	false,		03,		00,		[2, 3]], // Lvl 09	Teleporting Sentries
//	[10,			false,	false,	true,	false,		00,		32,		[1, 2]], // Lvl 10	//Elites Only//
//	[10,			false,	false,	true,	false,		00,		64,		[2, 4]], // Lvl 11	Hunters Only
//	[10,			false,	false,	true,	false,		00,		64,		[2, 4]], // Lvl 12	Chargers Only
//	[10,			true,	true,	false,	true,		04,		00,		[3, 3]], // Lvl 13	Swarmers & Teleporters
//	[10,			true,	true,	false,	true,		02,		00,		[2, 3]], // Lvl 14	Mixed Nuts
//	[10,			true,	false,	true,	true,		00,		64,		[3, 4]], // Lvl 15	//Everyone Is Here//
//	[10,			true,	false,	true,	true,		00,		32,		[2, 3]], // Lvl 16	Chargers & Swarmers
//	[10,			false,	true,	true,	false,		03,		48,		[2, 3]], // Lvl 17	Elite Hunters & Swarmers
//	[10,			true,	false,	true,	true,		00,		64,		[2, 5]], // Lvl 18	Triple Threat
//	[10,			true,	false,	false,	false,		00,		00,		[2, 4]], // Lvl 19	Swarmers & Sentries
//	[10,			true,	true,	false,	true,		05,		00,		[5, 7]], // Lvl 20	//Sentry Minefield//
//	[10,			true,	true,	false,	true,		03,		00,		[2, 4]], // Lvl 21	Minefield Sweepers
//	[10,			false,	false,	true,	false,		00,		96,		[2, 5]], // Lvl 22	Target Saturation (Hunters & Chargers)
//	[10,			false,	false,	true,	false,		00,		96,		[2, 5]], // Lvl 23	Target Saturation (Chargers & Swarmers)
//	[10,			false,	false,	true,	false,		00,		64,		[1, 4]], // Lvl 24	Target Saturation (Swarmers & Hunters)
//	[10,			true,	true,	false,	true,		03,		00,		[7, 7]]	 // Lvl 25	//Absolute Mayhem//
//]


//level_enemy_data_pool = [
//	//						LEVEL IDS
//	// OBJECT IDS			01	02	03	04	05	06	07	08	09	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	25
//	[obj_hunter_mk1,		50, 50, 00, 00, 50, 00, 00, 00, 00, 00, 00, 00, 00, 10, 20, 00, 00, 00, 00, 00, 00, 30, 00, 15, 30],
//	[obj_hunter_mk2,		00, 20, 20, 00, 30, 00, 00, 10, 00, 00, 30, 00, 00, 20, 20, 00, 00, 30, 00, 00, 00, 20, 00, 10, 20],
//	[obj_hunter_mk3,		00, 05, 00, 10, 10, 00, 00, 10, 00, 10, 10, 00, 00, 10, 10, 00, 50, 10, 00, 00, 00, 10, 00, 05, 10],
//	[obj_charger_mk1,		00, 00, 50, 20, 30, 00, 00, 00, 10, 00, 00, 00, 00, 20, 20, 00, 00, 00, 00, 00, 00, 15, 30, 00, 30],
//	[obj_charger_mk2,		00, 00, 20, 30, 30, 00, 10, 00, 05, 00, 00, 30, 00, 10, 20, 30, 00, 30, 00, 00, 20, 10, 20, 00, 20],
//	[obj_charger_mk3,		00, 00, 05, 10, 10, 00, 00, 00, 00, 10, 00, 10, 00, 10, 10, 20, 00, 10, 00, 00, 00, 05, 10, 00, 10],
//	[obj_swarmer_mk1,		00, 00, 00, 00, 00, 50, 00, 50, 00, 00, 00, 00, 30, 10, 20, 20, 00, 30, 00, 00, 00, 00, 15, 30, 30],
//	[obj_swarmer_mk2,		00, 00, 00, 00, 00, 30, 00, 00, 00, 00, 00, 00, 10, 00, 20, 10, 00, 10, 50, 00, 20, 00, 10, 20, 20],
//	[obj_swarmer_mk3,		00, 00, 00, 00, 00, 00, 20, 00, 00, 10, 00, 00, 00, 00, 10, 00, 10, 05, 00, 00, 00, 00, 05, 10, 10],
//	[obj_sentry_cannon,		05, 10, 00, 05, 00, 00, 00, 00, 10, 00, 00, 00, 00, 05, 20, 00, 00, 00, 20, 80, 00, 10, 10, 10, 20],
//	[obj_sentry_teleport,	00, 00, 00, 00, 00, 10, 10, 00, 60, 00, 00, 00, 20, 05, 10, 00, 00, 00, 00, 10, 60, 00, 00, 00, 10]
//	// ENEMY FREQUENCY		1-2	0-3	0-2	1-2	1-3	1-2	1-1	2-3	2-3	1-2	2-4	2-4	3-3	2-3	3-3	2-3	2-3	2-5	2-4	5-7	2-4	2-5	2-5	1-4	7-7]
//];

//level_enemy_data_density = [
//	// Enemy Density
//	[3, 3], // Lvl 00 
//	[1, 2], // Lvl 01	Hunter Introduction
//	[0, 3], // Lvl 02	Hunter Markup
//	[0, 2], // Lvl 03	Charger Introduction
//	[1, 2], // Lvl 04	Charger Markup
//	[1, 3], // Lvl 05	//Hunter X Charger//
//	[1, 2], // Lvl 06	Swarmer Introduction
//	[1, 1], // Lvl 07	Swarmer Heavy
//	[2, 3], // Lvl 08	Hunters & Swarmers
//	[2, 3], // Lvl 09	Teleporting Sentries
//	[1, 2], // Lvl 10	//Elites Only//
//	[2, 4], // Lvl 11	Hunters Only
//	[2, 4], // Lvl 12	Chargers Only
//	[3, 3], // Lvl 13	Swarmers & Teleporters
//	[2, 3], // Lvl 14	Mixed Nuts
//	[3, 4], // Lvl 15	//Everyone Is Here//
//	[2, 3], // Lvl 16	Chargers & Swarmers
//	[2, 3], // Lvl 17	Elite Hunters & Swarmers
//	[2, 5], // Lvl 18	Triple Threat
//	[2, 4], // Lvl 19	Swarmers & Sentries
//	[5, 7], // Lvl 20	//Sentry Minefield//
//	[2, 4], // Lvl 21	Minefield Sweepers
//	[2, 5], // Lvl 22	Target Saturation (Hunters & Chargers)
//	[2, 5], // Lvl 23	Target Saturation (Chargers & Swarmers)
//	[1, 4], // Lvl 24	Target Saturation (Swarmers & Hunters)
//	[7, 7]	// Lvl 25	//Absolute Mayhem//
//]


