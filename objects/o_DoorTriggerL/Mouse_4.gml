if (id == doorL && global.camera_up == false) {
    if (!animating) {
        if (closed == false) {
            o_DoorLeft.image_speed = 1;
            animating = true;
            o_DoorButtonL.image_index += 2;
        } else {
            o_DoorLeft.image_index = o_DoorLeft.image_number - 1;
            o_DoorLeft.image_speed = -1;
            o_DoorButtonL.image_index -= 2;
            animating = true;
        }

        if (!audio_played) {
            audio_play_sound(snd_SFXBible_12478, 0, 0);
            audio_played = true;
        }
    }   
} else if (id == lightL && global.camera_up == false) {
    // we use with() {} here to find the correct instance for lighton
	// because GML sometimes finds the wrong instance (like doorL instead of lightL)
    with (o_DoorTriggerR) {
        if (lighton == true) {
            o_DoorButtonR.image_index--; 
            lighton = false;
        }
    }

    audio_stop_sound(snd_BallastHumMedium2);
	
    if (lighton == false) {
        o_DoorButtonL.image_index++;
        lighton = true;
    } else {
        o_DoorButtonL.image_index--;
        lighton = false;
        o_Office.image_index = 0;
        audio_stop_sound(snd_BallastHumMedium2);
    }
}