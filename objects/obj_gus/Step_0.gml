var up = keyboard_check(ord("W"));
var down = keyboard_check(ord("S"));
var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var roll = keyboard_check(vk_space);

//Movement
if (state == "move_state"){
	move_x = right - left;
	move_y = down - up;
	
	if(up || down || left || right){
		mdirection = point_direction(0, 0, move_x, move_y);     
		direction = mdirection;
		
		speed = mspeed;	
	} else {
		speed = 0;	
	}
}

//roll check
if (roll && (state != "roll_state") && !rollOnCD){
	state = "roll_state";
	alarm[0] = 15;
}

//roll code
if(state == "roll_state"){
	speed = 6;
}