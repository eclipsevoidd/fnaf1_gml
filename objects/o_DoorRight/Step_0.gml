// We want the door to animate at 30 frames per second, regardless of lag.
var anim_speed = 30; 

if (global.right_door_closed) {
    // Add to the image_index using real-world delta_time
    image_index += anim_speed * (delta_time / 1000000);
    
    // Stop at the last frame
    if (image_index > image_number - 1) {
        image_index = image_number - 1;
    }
} else {
    // Subtract from the image_index to open it
    image_index -= anim_speed * (delta_time / 1000000);
    
    // Stop at the first frame
    if (image_index < 0) {
        image_index = 0;
    }
}