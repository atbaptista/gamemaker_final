function scr_collide(){
/* could prob figure out a way to make this more efficient
if rolling set speed to 0 and return to move state, since 
it has weird movement stuff otherwise */
	
	//collide with wall
	if(instance_place(x+hspeed, y, obj_wall)){
		hspeed = 0;
		if(state == "roll_state"){
			speed = 0;
			state = "move_state";
		}
	}
	if(instance_place(x, y+vspeed, obj_wall)){
		vspeed = 0;
		if(state == "roll_state"){
			speed = 0;
			state = "move_state";
		}
	}

	//collide with enemy1 obj
	if(instance_place(x+hspeed, y, obj_enemy1)){
		hspeed = 0;
		if(state == "roll_state"){
			speed = 0;
			state = "move_state";
		}
	}
	if(instance_place(x, y+vspeed, obj_enemy1)){
		vspeed = 0;
		if(state == "roll_state"){
			speed = 0;
			state = "move_state";
		}
	}
	
}