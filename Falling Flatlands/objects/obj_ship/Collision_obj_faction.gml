// Exit if object is part of same faction.
if other.faction == faction exit;
//else if ship_shield_enabled {
//	with(other) {
//		event_perform(ev_other, ev_user0);
//	}
//	exit;
//}

//event_perform(ev_other, ev_user0);

with(other) {
	event_perform(ev_other, ev_user0);
}
event_perform(ev_other, ev_user0);