if (image_speed > 0 && image_index >= image_number - 1) {
    image_speed = 0;
    image_index = image_number - 1;
    
    o_DoorTriggerR.closed = 2;
    o_DoorTriggerR.animating = false;
    o_DoorTriggerR.audio_played = false; 
}

if (image_speed < 0 && image_index <= 0) {
    image_speed = 0;
    image_index = 0;
    
    o_DoorTriggerR.closed = 0;
    o_DoorTriggerR.animating = false;
	o_DoorTriggerR.audio_played = false;
}