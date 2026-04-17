var dt = delta_time / 1000000;

if (global.camera_up && !global.is_dead) {

    // 2. UNIVERSAL TIMERS (Feed and Static)
    feed_frame += feed_fps * dt;
    if (feed_frame >= 10000) feed_frame = 0;

	// Loop through every camera and count down their individual blackouts
	for (var i = 0; i < array_length(global.camera_blackouts); i++) {
	    if (global.camera_blackouts[i] > 0) {
	        global.camera_blackouts[i] -= dt;
	    }
	}
    
    static_frame += static_fps * dt;
    // Loop static based on how many frames s_CamStatic actually has
    if (static_frame >= sprite_get_number(s_CamStatic)) static_frame = 0;

    // 3. BUTTON CLICK DETECTION (Re-pressable!)
    if (mouse_check_button_pressed(mb_left)) {
        var mx = device_mouse_x_to_gui(0);
        var my = device_mouse_y_to_gui(0);
        var ui_scale = display_get_gui_height() / 720;
        
        for (var i = 0; i < array_length(cameras); i++) {
            var cam = cameras[i];
            var btn_x = cam.bx * ui_scale;
            var btn_y = cam.by * ui_scale;
            
            if (point_in_rectangle(mx, my, btn_x - (20 * ui_scale), btn_y - (12 * ui_scale), btn_x + (20 * ui_scale), btn_y + (12 * ui_scale))) {
                
                // Set the camera
                global.current_cam = i;
                
                // Destroy old flash if it exists, and spawn a new one!
                if (instance_exists(o_BlipFlash)) {
                    instance_destroy(o_BlipFlash);
                }
                var camBlip = instance_create_depth(0, 0, -1000, o_BlipFlash);
                camBlip.image_index = 0; // Ensure it starts at frame 0
                
                audio_play_sound(snd_blip, 0, false);
                break; 
            }
        }
    }
}