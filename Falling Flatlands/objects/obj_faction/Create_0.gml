
faction = factions.neutral;
last_collider = noone;


/*
This array should be given to every object instance that is capable of colliding with other objects.
It requires both colliding parties to have a sprite. 

In the obj_faction collision step, a line is drawn from the origin of the sprite to the edge of the 
sprite in the direction where the collision took place. The resulting data is then stored in this array, 
and is used to determine and update the EXACT (pixel perfect) coordinates that each collission occured 
in for every child instance of this parent. 

In the end step, these coordinates are updated to follow the object's movement and rotation to ensure
they stay locked to the appropriate position based on when the collision first took place.

This array does not delete it's data entries, so objects that exist for too long could potentially hinder
the game speed.
*/
collision_detection_data = [];