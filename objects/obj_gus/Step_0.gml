/// @description obj_gus step code

#region Variables

var up = keyboard_check(ord("W"));
var down = keyboard_check(ord("S"));
var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var roll = keyboard_check(vk_space);
var attack = mouse_check_button_pressed(mb_left);
var anim = spr_gus;

#endregion


#region Moving

if (state == "move_state"){
	if (!attacking){
		switch(direction){
			case 0:
				sprite_index = spr_gus_right_m;
				break;
			case 45:
				sprite_index = spr_gus_right_up_m;
				break;
			case 90:
				sprite_index = spr_gus_up_m;
				break;
			case 135:
				sprite_index = spr_gus_left_up_m;
				break;
			case 180:
				sprite_index = spr_gus_left_m;
				break;
			case 225:
				sprite_index = spr_gus_left_down_m;
				break;
			case 270:
				sprite_index = spr_gus_down_m;
				break;
			case 315:
				sprite_index = spr_gus_right_down_m;
				break;
		}
	}
	if(!attacking && speed == 0){
		switch(direction){
			case 0:
				sprite_index = spr_gus_right_i;
				break;
			case 45:
				sprite_index = spr_gus_right_up_i;
				break;
			case 90:
				sprite_index = spr_gus_up_i;
				break;
			case 135:
				sprite_index = spr_gus_left_up_i;
				break;
			case 180:
				sprite_index = spr_gus_left_i;
				break;
			case 225:
				sprite_index = spr_gus_left_down_i;
				break;
			case 270:
				sprite_index = spr_gus_down_i;
				break;
			case 315:
				sprite_index = spr_gus_right_down_i;
				break;
		}
	}
	//sprite_index = spr_gus;
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
	if(!attacking){
		sprite_index = spr_gus_down_r;
	}
	//alarm[0] = 15;
}

//roll code
if(state == "roll_state"){
	speed = rspeed;	
}

#endregion


#region Attacking

//check if attack pressed
if(attack && state != "roll_state" && !attacking){
	show_debug_message("attacking");
	attacking = true;
	//attack animation
	sprite_index = spr_gus_attk;
}

//attack
if(attacking){
	show_debug_message("attacking code");
	//second frame of the attack and if the hitbox doesnt exist 
	if(true){
		
	}
	if(image_index >= 2 && !instance_exists(obj_damage)){
		show_debug_message("spawnbox");
		//set timer to delete the attack hitbox
		alarm[2] = 2;
		//create sword hitbox to the right of the player
		instance_create_layer(x+10, y-5, layer, obj_damage);		
	}
}

#endregion


#region Collision

/* could prob figure out a way to make this more efficient.
if rolling set speed to 0 and return to move state, it has 
weird movement bugs otherwise */
	
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

#endregion


#region Enter Different Area

/* player might have to play through entire area again if they 
walk through the change level obj after exit, think of way to 
prevent that from happening */ 

//^^^changed room to persistent, we'll see how that works

//check if returned to main room
if(global.returned){
	//teleport player outside of the dungeon/level whatever
	x = global.prev_x;
	y = global.prev_y+20; //20 pixels lower so they dont teleport back instantly
	//set global returned to false
	global.returned = false;
}

//change creation code of obj_change_level to whichever room u want to teleport the player to
var nextArea = instance_place(x,y, obj_change_level);
//if touching changelvl obj save location and go to the specified room
if(nextArea){
	global.prev_x = x;
	global.prev_y = y;
	room_goto(nextArea.nextRoom);
}

//send player back to the main room and set the returned var to true
if(place_meeting(x,y,obj_return)){
	//change this to main room after levels are made
	room_goto(temp);
	global.returned = true;
}

#endregion


#region Animations and Sounds
/*
if(anim != sprite_index){
	sprite_index = anim;
} 	
*/


#endregion