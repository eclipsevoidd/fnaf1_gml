// animation speed (FPS)
var anim_speed = 30; 

if (global.left_door_closed) {
	// closing animation
    image_index += anim_speed * (delta_time / 1000000);
    
    // stop at last frame
    if (image_index > image_number - 1) {
        image_index = image_number - 1;
    }
} else {
    // opening animation
    image_index -= anim_speed * (delta_time / 1000000);
    
    // stop at first frmae
    if (image_index < 0) {
        image_index = 0;
    }
}