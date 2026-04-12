// ==========================================
// 1. DYNAMIC UI HOVER ZONE MATH
// ==========================================
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var screen_w = display_get_gui_width();
var screen_h = display_get_gui_height();
var ui_scale = screen_h / 720;

// THE FIX: Increased base width from 400 to 600 to cover the chevrons
var base_hover_w = 600; 
var base_hover_h = 60;

// Scale the hitbox based on the monitor size
var hover_w = base_hover_w * ui_scale;
var hover_h = base_hover_h * ui_scale;

// Anchor perfectly to the bottom center
var hover_x1 = (screen_w / 2) - (hover_w / 2);
var hover_y1 = screen_h - hover_h;
var hover_x2 = (screen_w / 2) + (hover_w / 2);
var hover_y2 = screen_h;

var is_hovered = point_in_rectangle(mx, my, hover_x1, hover_y1, hover_x2, hover_y2);

// If the mouse enters the zone, we aren't dead, and we aren't ALREADY animating...
if (is_hovered && !camera_button_hovered && !animating && !global.is_dead) {
    camera_button_hovered = true; // Lock it so it doesn't trigger 60 times a second
    trigger_flip();
} else if (!is_hovered) {
    camera_button_hovered = false; // Unlock it when they move the mouse away
}


// ==========================================
// 2. THE DELTA-TIME ANIMATION
// ==========================================
if (animating) {
    // Add (or subtract) frames based on direction and real-world time
    anim_index += (anim_speed * anim_dir) * (delta_time / 1000000);

    // DID WE FINISH PULLING IT UP?
    if (anim_dir == 1 && anim_index >= sprite_get_number(s_MonitorAnimation) - 1) {
        anim_index = sprite_get_number(s_MonitorAnimation) - 1;
        animating = false;
        
        global.left_light_on = false;
        global.right_light_on = false;
        audio_stop_sound(snd_BallastHumMedium2);
        
        global.camera_up = true; // Tell the game the monitor is officially up!

        // ==========================================
        // SPAWN THE BLIP FLASH ON OPEN
        // ==========================================
		if (!instance_exists(o_BlipFlash)) {
			var camBlip = instance_create_depth(0, 0, -1000, o_BlipFlash);
			camBlip.image_index = 0; // Ensure it starts on frame 0
		}
        // ==========================================

        audio_sound_gain(snd_Fan, 0.25, 0);
        audio_play_sound(snd_MiniDV_Tape_Eject_1, 0, true, 0.25);
    }
    
    // DID WE FINISH PUTTING IT DOWN?
    else if (anim_dir == -1 && anim_index <= 0) {
        anim_index = 0;
        animating = false;
    }
}