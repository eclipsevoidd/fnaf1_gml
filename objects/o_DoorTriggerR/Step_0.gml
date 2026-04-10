if (lighton && !o_DoorTriggerL.lighton) {
	if (o_DoorTriggerL.rand_10 > 1) {	
		o_Office.image_index = 2;
		if (!audio_is_playing(snd_BallastHumMedium2)) {
			audio_play_sound(snd_BallastHumMedium2, 0, true, 1);
		}
	} else {
		o_Office.image_index = 0;
		audio_stop_sound(snd_BallastHumMedium2);
	}
}