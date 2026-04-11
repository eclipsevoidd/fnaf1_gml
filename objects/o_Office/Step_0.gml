light_timer += (delta_time / 1000000);
if (light_timer >= 0.01) {
    light_roll = irandom_range(1, 10);
    light_timer = 0;
}

// 2. The Visual & Audio Execution
if (global.left_light_on) {
    if (light_roll > 1) {
        o_Office.image_index = 1;
        if (!audio_is_playing(snd_BallastHumMedium2)) audio_play_sound(snd_BallastHumMedium2, 0, true, 1);
    } else {
        o_Office.image_index = 0;
    }
} else if (global.right_light_on) {
    if (light_roll > 1) {
        o_Office.image_index = 2; // Assuming 2 is your right light sprite
        if (!audio_is_playing(snd_BallastHumMedium2)) audio_play_sound(snd_BallastHumMedium2, 0, true, 1);
    } else {
        o_Office.image_index = 0;
    }
} else {
    // Both lights are off
    o_Office.image_index = 0;
    audio_stop_sound(snd_BallastHumMedium2);
}