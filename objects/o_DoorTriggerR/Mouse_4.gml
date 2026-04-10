if (id == doorR && global.camera_up == false) {
    if (!animating) {
        if (closed == false) {
            o_DoorRight.image_speed = 1;
            animating = true;
            o_DoorButtonR.image_index += 2;
        } else {
            o_DoorRight.image_index = o_DoorRight.image_number - 1;
            o_DoorRight.image_speed = -1;
            o_DoorButtonR.image_index -= 2;
            animating = true;
        }

        if (!audio_played) {
            audio_play_sound(snd_SFXBible_12478, 0, 0);
            audio_played = true;
        }
    }   
} else if (id == lightR && global.camera_up == false) {
	with (o_DoorTriggerL) {
        if (lighton == true) {
            o_DoorButtonL.image_index--;
            lighton = false;
        }
	}
	
    audio_stop_sound(snd_BallastHumMedium2);

    if (lighton == false) {
        o_DoorButtonR.image_index++;
        lighton = true;
    } else {
        o_DoorButtonR.image_index--;
        lighton = false;
        o_Office.image_index = 0;
        audio_stop_sound(snd_BallastHumMedium2);
    }
}