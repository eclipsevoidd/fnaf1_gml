animating = false;
anim_speed = 25; // FPS
anim_index = 0;
anim_dir = 1;    // 1 for pulling up, -1 for putting down

// hover cooldown
camera_button_hovered = false;

// The flip function we can call whenever we want!
trigger_flip = function() {
    animating = true;
    
    if (!global.camera_up) {
        // START FLIPPING UP
        anim_dir = 1;
        anim_index = 1;
        
        // Play up sound
        audio_play_sound(snd_CAMERA_VIDEO_LOA_601snd_05303, 0, false);
    } else {
        global.camera_up = false;
        
        // START FLIPPING DOWN
        anim_dir = -1;
        // Start at the very last frame of the animation
        anim_index = sprite_get_number(s_MonitorAnimation) - 1;
        
        // Play down sound
        audio_stop_sound(snd_CAMERA_VIDEO_LOA_601snd_05303);
        audio_play_sound(snd_put_down, 0, false);
        audio_stop_sound(snd_MiniDV_Tape_Eject_1);
        audio_sound_gain(snd_Fan, 1, 0);
    }
}