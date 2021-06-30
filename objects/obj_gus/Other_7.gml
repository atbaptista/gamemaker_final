if (sprite_index == spr_gus_attk){
	show_debug_message("no longer attacking");
	show_debug_message(string(state));
	//finished attacking
	attacking = false;
	instance_destroy(obj_damage);
	//temp fix, can delete after the movement commands and roll have own sprite setting code stuff
	//changes the sprite back to moving one after attacking is finished
	//sprite_index = spr_gus;
	
}

//after roll state change to move state and put roll on cd
if (state == "roll_state") {
    state = "move_state";
	rollOnCD = true;
	alarm[1] = 45;
}
