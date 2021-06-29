#region Variables

var up = keyboard_check(ord("W"));
var down = keyboard_check(ord("S"));
var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var roll = keyboard_check(vk_space);
var attack = mouse_check_button_pressed(mb_left);

#endregion


#region Moving

if (state == "move_state"){
	//calculate direction
	move_x = right - left;
	move_y = down - up;
	
	//if moving
	if(up || down || left || right){
		//point in one of 8 directions
		mdirection = point_direction(0, 0, move_x, move_y);     
		direction = mdirection;
		
		//change speed
		speed = mspeed;	
		
	//momentum if i ever make the move speed fast
	} else if (speed > 0){
		speed--;	
	}
}

#endregion


#region Rolling

//check that not in roll state already and roll isn't on cd
if (roll && (state != "roll_state") && !rollOnCD){
	state = "roll_state";
	//roll length
	alarm[0] = 15;
}

//roll code
if(state == "roll_state"){
	speed = rspeed;	
}

#endregion


#region Attacking

//check if attack pressed
if(attack && state != "roll_state" && !attacking){
	attacking = true;
	//attack animation
	sprite_index = spr_gus_attk;
}

//attack
if(attacking){
	//second frame of the attack and if the hitbox doesnt exist 
	if(image_index >= 2 && !instance_exists(obj_damage)){
		//set timer to delete the attack hitbox
		alarm[2] = 2;
		//create sword hitbox to the right of the player
		instance_create_layer(x+10, y-5, layer, obj_damage);		
	}
}

#endregion