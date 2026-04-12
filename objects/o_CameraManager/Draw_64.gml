if (global.camera_up && !global.is_dead) {
    var screen_w = display_get_gui_width();
    var screen_h = display_get_gui_height();
    var ui_scale = screen_h / 720;

    // ==========================================
    // LAYER 1: OVERLAYS (Animated Static & Border)
    // ==========================================
    // The feed is safely rendering underneath this in the Room layer!
    draw_sprite_stretched_ext(s_CamStatic, static_frame, 0, 0, screen_w, screen_h, c_white, 0.35);
    draw_sprite_stretched(s_CamBorder, 0, 0, 0, screen_w, screen_h);

    // ==========================================
    // LAYER 2: THE MAP & BUTTONS
    // ==========================================
    draw_sprite_ext(s_CamMap, 0, 848 * ui_scale, 313 * ui_scale, ui_scale, ui_scale, 0, c_white, 1);
    
    for (var i = 0; i < array_length(cameras); i++) {
        var cam = cameras[i];
        
        var btn_frame = 0;
        if (global.current_cam == i) {
            btn_frame = 1;
        }
        
        draw_sprite_ext(s_CameraButton, btn_frame, cam.bx * ui_scale, cam.by * ui_scale, ui_scale, ui_scale, 0, c_white, 1);
        draw_sprite_ext(s_CamButtonText, i, cam.tx * ui_scale, cam.ty * ui_scale, ui_scale, ui_scale, 0, c_white, 1);
    }
}