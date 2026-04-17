function Animatronic(_name, _ai_level, _move_interval) constructor {
    name = _name;
    ai_level = _ai_level;
    move_interval = _move_interval;
    move_timer = 0;
    current_space = 0;
    path = [];

    static update = function(_dt) {
        if (ai_level <= 0) return;
        move_timer += _dt;
        if (move_timer >= move_interval) {
            move_timer = 0;
            if (irandom_range(1, 20) <= ai_level) {
                attempt_move();
            }
        }
    }

    static attempt_move = function() {
        // --- FIX: Define the variables that were causing the crash ---
        if (current_space >= array_length(path) - 1) return; 

        var old_cam = path[current_space];
        current_space++;
        var new_cam = path[current_space];
        // -------------------------------------------------------------

        // 1. Update the actual visuals
        o_NightManager.refresh_camera_visuals(old_cam);
        o_NightManager.refresh_camera_visuals(new_cam);

        // 2. Audio for movement (Footsteps)
        if (audio_is_playing(snd_deepsteps)) audio_stop_sound(snd_deepsteps);
        audio_play_sound(snd_deepsteps, 0, false, random_range(0.1, 0.3));

        // 3. Localized Blackout
        global.camera_blackouts[old_cam] = 2.0;

        if (instance_exists(o_CameraManager)) {
            o_CameraManager.static_alpha = 1.0; 
        }

        // 4. Camera UI Effects
        if (global.camera_up) {
            // Kill old garble
            if (audio_is_playing(snd_garble1)) audio_stop_sound(snd_garble1);
            if (audio_is_playing(snd_garble2)) audio_stop_sound(snd_garble2);
            if (audio_is_playing(snd_garble3)) audio_stop_sound(snd_garble3);
            
            audio_play_sound(choose(snd_garble1, snd_garble2, snd_garble3), 0, false, random_range(0.2, 0.5));
            
            // Trigger blip flash if viewing affected cams
            if (global.current_cam == old_cam || global.current_cam == new_cam) {
                if (!instance_exists(o_BlipFlash)) {
                    instance_create_depth(0, 0, -1000, o_BlipFlash);
                }
            }
        }
    }
}