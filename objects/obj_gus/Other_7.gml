/// @description obj_gus Animation End code

if (sprite_index == spr_gus_attk){
	//finished attacking
	attacking = false;
	//remove the hitbox
	instance_destroy(obj_damage);
}

//after roll state change to move state and put roll on cd
if (state == "roll_state") {
    state = "move_state";
	rollOnCD = true;
	alarm[1] = 45;
}
