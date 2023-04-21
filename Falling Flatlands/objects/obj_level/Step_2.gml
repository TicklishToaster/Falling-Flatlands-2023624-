// Automatically set win conditions as complete if they are not applicable to the level.
if (condition_win_portal == false && condition_win_complete_portal == false) {
    condition_win_complete_portal = true;
}
if (condition_win_key == false && condition_win_complete_key == false) {
    condition_win_complete_key = true;
}
if (condition_win_enemy == false && condition_win_complete_enemy == false) {
    condition_win_complete_enemy = true;
}


// Unhide portal if either key or enemy condition get completed.
if (condition_portal_hidden == true) {
	if (condition_win_key == true && condition_win_complete_key == true) {
	    condition_portal_hidden = false;
	}
	else if (condition_win_enemy == true && condition_win_complete_enemy == true) {
	    condition_portal_hidden = false;
	}
}


//// Check for portal win condition.
//if (condition_win_portal == true && condition_win_complete_portal == false) {
//    // code here
//}

// Check for key win condition.
if (condition_win_key == true && condition_win_complete_key == false) {
	if (condition_key_number >= condition_key_number_max) {
		condition_win_complete_key = true;
	}
}

// Check for enemy win condition.
if (condition_win_enemy == true && condition_win_complete_enemy == false) {
	if (condition_enemy_number >= condition_enemy_number_max) {
		condition_win_complete_enemy = true;
	}
}

// Check if all win conditions are met.
if (condition_win_complete_portal == true && condition_win_complete_key == true && condition_win_complete_enemy == true) {
	// Play level exit audio clips.
	audio_play_sound(UI__FTL____Level_Complete, 10, false, 0.5);	
	audio_play_sound(UI__FTL____Level_Exit, 10, false, 0.5);
	obj_menu.menu_active = true;
	room_goto(rm_start);
}


