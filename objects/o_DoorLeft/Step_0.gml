if (image_speed > 0 && image_index >= image_number - 1) {
    image_speed = 0;
    image_index = image_number - 1;
    
    o_DoorTriggerL.closed = 2;
    o_DoorTriggerL.animating = false;
    o_DoorTriggerL.audio_played = false; 
}

if (image_speed < 0 && image_index <= 0) {
    image_speed = 0;
    image_index = 0;
    
    o_DoorTriggerL.closed = 0;
    o_DoorTriggerL.animating = false;
	o_DoorTriggerL.audio_played = false;
}