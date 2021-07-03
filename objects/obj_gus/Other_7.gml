/// @description obj_gus Animation End code

switch(sprite_index){
		case spr_gus_right_a:
		case spr_gus_left_a:
		case spr_gus_up_a:
		case spr_gus_down_a:
			//finished attacking
			attacking = false;
			//remove the hitbox
			instance_destroy(obj_damage);
			break;
}
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
