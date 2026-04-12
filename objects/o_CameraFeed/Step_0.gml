var dt = delta_time / 1000000;

if (global.camera_up && !global.is_dead) {
    switch (pan_state) {
        case 0: // Move Left (offset increases)
            cam_pan_offset += pan_speed * dt;
            if (cam_pan_offset >= 320) { cam_pan_offset = 320; pan_state = 1; }
            break;
        case 1: // Wait
            pan_timer += dt;
            if (pan_timer >= pan_wait) { pan_timer = 0; pan_state = 2; }
            break;
        case 2: // Move Right (offset decreases)
            cam_pan_offset -= pan_speed * dt;
            if (cam_pan_offset <= 0) { cam_pan_offset = 0; pan_state = 3; }
            break;
        case 3: // Wait
            pan_timer += dt;
            if (pan_timer >= pan_wait) { pan_timer = 0; pan_state = 0; }
            break;
    }
}