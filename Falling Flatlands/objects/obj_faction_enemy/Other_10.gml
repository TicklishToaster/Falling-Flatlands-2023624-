/// @description Apply Damage

// Deduct damage number from health points.
health_points -= take_damage;

// Set collision damage cooldown to true to prevent damage on every frame.
collision_damage_cooldown = true;

// Reset take damage.
take_damage = 0;