if (sprite_index == spr_gus_attk){
	//finished attacking
	attacking = false;
	
	//temp fix, can delete after the movement commands and roll have own sprite setting code stuff
	//changes the sprite back to moving one after attacking is finished
	sprite_index = spr_gus;
}