if position_meeting(mouse_x,mouse_y,id){
    sprite_index = spr_hover;
} else {
	sprite_index = spr_button;
}

if mouse_check_button_pressed(mb_left) and position_meeting(mouse_x,mouse_y,id){
    room_goto(link);
	//audio_play_sound(song, 1, true);
 }    
