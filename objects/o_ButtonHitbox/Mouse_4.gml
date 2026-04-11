if (!global.camera_up && !global.is_dead) {
    
    switch (action_type) {
        case "left_door":
            // Get the final frame of the animation
            var max_frame_l = o_DoorLeft.image_number - 1;
            
            // Only allow the toggle if the door is fully open OR fully closed
            if (o_DoorLeft.image_index <= 0 || o_DoorLeft.image_index >= max_frame_l) {
                global.left_door_closed = !global.left_door_closed;
                audio_play_sound(snd_SFXBible_12478, 0, false);
            }
            break;
            
        case "left_light":
            global.left_light_on = !global.left_light_on;
            if (global.left_light_on) global.right_light_on = false;
            break;
            
        case "right_door":
            var max_frame_r = o_DoorRight.image_number - 1;
            
            if (o_DoorRight.image_index <= 0 || o_DoorRight.image_index >= max_frame_r) {
                global.right_door_closed = !global.right_door_closed;
                audio_play_sound(snd_SFXBible_12478, 0, false);
            }
            break;
            
        case "right_light":
            global.right_light_on = !global.right_light_on;
            if (global.right_light_on) global.left_light_on = false;
            break;
    }
}